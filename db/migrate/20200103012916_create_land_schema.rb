class CreateLandSchema < ActiveRecord::Migration[5.0]
  QUERY_PARAMS = %w[
    app
    ad_type
    ad_group
    bid_match_type
    campaign
    content
    creative
    device_type
    experiment
    keyword
    match_type
    medium
    network
    placement
    position
    search_term
    source
    subsource
    target
  ]

  def schema
    Land.config.schema
  end

  def up
    execute "CREATE SCHEMA #{schema};"

    with_options schema: schema do |t|
      # Query params
      t.create_lookup_tables(*QUERY_PARAMS.map(&:pluralize))

      # User agent
      t.create_lookup_table  :devices
      t.create_lookup_tables :user_agent_types, :browsers, :platforms, small: true

      # HTTP
      t.create_lookup_tables :domains, :paths, :query_strings
      t.create_lookup_tables :http_methods, :mime_types, small: true

      t.create_lookup_table :event_types, small: true
    end

    execute %[CREATE EXTENSION "uuid-ossp";]

    enable_extension "uuid-ossp"

    execute %[ALTER EXTENSION "uuid-ossp" SET SCHEMA "public";]

    execute <<~SQL
      SET search_path TO #{schema},public;

      INSERT INTO user_agent_types (user_agent_type) VALUES ('user'), ('ping'), ('crawl'), ('scrape'), ('scan');

      CREATE TABLE user_agents (
          user_agent_id      SERIAL      PRIMARY KEY

        , user_agent_type_id SMALLINT    REFERENCES user_agent_types

        , device_id          INTEGER     REFERENCES devices
        , platform_id        SMALLINT    REFERENCES platforms
        , browser_id         SMALLINT    REFERENCES browsers
        , browser_version    TEXT

        , user_agent         TEXT        NOT NULL UNIQUE

        , created_at         TIMESTAMPTZ NOT NULL DEFAULT NOW()
      );

      CREATE INDEX ON user_agents (device_id);
      CREATE INDEX ON user_agents (platform_id);
      CREATE INDEX ON user_agents (browser_id);

      ALTER TABLE ad_types        ALTER COLUMN ad_type_id        SET DATA TYPE SMALLINT;
      ALTER TABLE bid_match_types ALTER COLUMN bid_match_type_id SET DATA TYPE SMALLINT;
      ALTER TABLE device_types    ALTER COLUMN device_type_id    SET DATA TYPE SMALLINT;
      ALTER TABLE match_types     ALTER COLUMN match_type_id     SET DATA TYPE SMALLINT;
      ALTER TABLE networks        ALTER COLUMN network_id        SET DATA TYPE SMALLINT;
      ALTER TABLE positions       ALTER COLUMN position_id       SET DATA TYPE SMALLINT;

      CREATE TABLE attributions (
          attribution_id SERIAL PRIMARY KEY

        , #{QUERY_PARAMS.map { |name| format('%s INTEGER REFERENCES %s', name.foreign_key, name.pluralize) }.join(',') }

        , created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

        , UNIQUE (#{QUERY_PARAMS.map(&:foreign_key).join(',')})
      );

      ALTER TABLE attributions
          ALTER COLUMN ad_type_id        SET DATA TYPE SMALLINT
        , ALTER COLUMN bid_match_type_id SET DATA TYPE SMALLINT
        , ALTER COLUMN device_type_id    SET DATA TYPE SMALLINT
        , ALTER COLUMN match_type_id     SET DATA TYPE SMALLINT
        , ALTER COLUMN network_id        SET DATA TYPE SMALLINT
        , ALTER COLUMN position_id       SET DATA TYPE SMALLINT
      ;

      #{QUERY_PARAMS.map { |p| "CREATE INDEX ON attributions (#{p.foreign_key});" }.join("\n")}

      CREATE TABLE referers (
          referer_id      SERIAL  PRIMARY KEY

        , domain_id       INTEGER NOT NULL REFERENCES domains
        , path_id         INTEGER NOT NULL REFERENCES paths
        , query_string_id INTEGER NOT NULL REFERENCES query_strings

        , attribution_id  INTEGER NOT NULL REFERENCES attributions

        , UNIQUE (domain_id, path_id, query_string_id, attribution_id)
      );

      CREATE INDEX ON referers (domain_id);
      CREATE INDEX ON referers (path_id);
      CREATE INDEX ON referers (query_string_id);

      CREATE INDEX ON referers (attribution_id);

      CREATE TABLE cookies (
          cookie_id UUID PRIMARY KEY DEFAULT uuid_generate_v4()
      );

      CREATE TABLE owners (
          owner_id SERIAL PRIMARY KEY
        , owner    TEXT   NOT NULL UNIQUE
      );

      CREATE TABLE ownerships (
          ownership_id SERIAL PRIMARY KEY

        , owner_id  INTEGER NOT NULL REFERENCES owners
        , cookie_id UUID    NOT NULL REFERENCES cookies

        , UNIQUE (owner_id, cookie_id)
      );

      CREATE TABLE visits (
          visit_id       UUID                 PRIMARY KEY DEFAULT uuid_generate_v4()

        , cookie_id      UUID        NOT NULL REFERENCES  cookies

        , user_agent_id  INTEGER     NOT NULL REFERENCES  user_agents
        , attribution_id INTEGER     NOT NULL REFERENCES  attributions

        , referer_id     INTEGER              REFERENCES  referers
        , owner_id       INTEGER              REFERENCES  owners

        , ip_address     INET        NOT NULL

        , created_at     TIMESTAMPTZ NOT NULL DEFAULT NOW()
        , updated_at     TIMESTAMPTZ NOT NULL DEFAULT NOW()
      );

      CREATE INDEX ON visits (cookie_id);
      CREATE INDEX ON visits (user_agent_id);
      CREATE INDEX ON visits (attribution_id);
      CREATE INDEX ON visits (referer_id);
      CREATE INDEX ON visits (owner_id);

      CREATE TABLE pageviews (
          pageview_id     UUID     PRIMARY KEY DEFAULT uuid_generate_v4()

        , visit_id        UUID     NOT NULL REFERENCES visits
        , path_id         INTEGER  NOT NULL REFERENCES paths
        , query_string_id INTEGER  NOT NULL REFERENCES query_strings

        , mime_type_id    SMALLINT          REFERENCES mime_types
        , http_method_id  SMALLINT NOT NULL REFERENCES http_methods

        , request_id      UUID

        , click_id        TEXT

        , http_status     INTEGER
        , response_time   INTEGER

        , created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
      );

      CREATE INDEX ON pageviews (visit_id);
      CREATE INDEX ON pageviews (path_id);
      CREATE INDEX ON pageviews (query_string_id);
      CREATE INDEX ON pageviews (request_id);
      CREATE INDEX ON pageviews (click_id);

      CREATE TABLE events (
          event_id      UUID        PRIMARY KEY DEFAULT uuid_generate_v4()

        , event_type_id SMALLINT    NOT NULL REFERENCES event_types
        , visit_id      UUID        NOT NULL REFERENCES visits

        , meta          JSON

        , created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
      );

      CREATE INDEX ON events (event_type_id);
      CREATE INDEX ON events (visit_id);


      INSERT INTO bid_match_types (bid_match_type) VALUES ('bidded broad'), ('bidded content'), ('bidded exact'), ('bidded phrase');
      INSERT INTO device_types    (device_type)    VALUES ('computer'), ('mobile'), ('tablet');
      INSERT INTO match_types     (match_type)     VALUES ('broad'), ('phrase'), ('exact');
      INSERT INTO networks        (network)        VALUES ('google_search'), ('search_partner'), ('display_network');

      CREATE VIEW response_times_by_path AS SELECT *
        FROM (
          SELECT path_id
               , path
               , ROUND(AVG(response_time), 3) AS "avg response time (ms)"

          FROM land.pageviews pv
          JOIN land.paths     p USING (path_id)

          GROUP BY path_id, path
        )  agg

        ORDER BY agg."avg response time (ms)" DESC
        ;
    SQL
  end
end
