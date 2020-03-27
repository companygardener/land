SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: land; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA land;


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ad_groups; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.ad_groups (
    ad_group_id bigint NOT NULL,
    ad_group text NOT NULL
);


--
-- Name: ad_groups_ad_group_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.ad_groups_ad_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_groups_ad_group_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.ad_groups_ad_group_id_seq OWNED BY land.ad_groups.ad_group_id;


--
-- Name: ad_types; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.ad_types (
    ad_type_id smallint NOT NULL,
    ad_type text NOT NULL
);


--
-- Name: ad_types_ad_type_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.ad_types_ad_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_types_ad_type_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.ad_types_ad_type_id_seq OWNED BY land.ad_types.ad_type_id;


--
-- Name: apps; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.apps (
    app_id bigint NOT NULL,
    app text NOT NULL
);


--
-- Name: apps_app_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.apps_app_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: apps_app_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.apps_app_id_seq OWNED BY land.apps.app_id;


--
-- Name: attributions; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.attributions (
    attribution_id integer NOT NULL,
    app_id integer,
    ad_type_id smallint,
    ad_group_id integer,
    bid_match_type_id smallint,
    campaign_id integer,
    content_id integer,
    creative_id integer,
    device_type_id smallint,
    experiment_id integer,
    keyword_id integer,
    match_type_id smallint,
    medium_id integer,
    network_id smallint,
    placement_id integer,
    position_id smallint,
    search_term_id integer,
    source_id integer,
    subsource_id integer,
    target_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: attributions_attribution_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.attributions_attribution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attributions_attribution_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.attributions_attribution_id_seq OWNED BY land.attributions.attribution_id;


--
-- Name: bid_match_types; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.bid_match_types (
    bid_match_type_id smallint NOT NULL,
    bid_match_type text NOT NULL
);


--
-- Name: bid_match_types_bid_match_type_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.bid_match_types_bid_match_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bid_match_types_bid_match_type_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.bid_match_types_bid_match_type_id_seq OWNED BY land.bid_match_types.bid_match_type_id;


--
-- Name: browsers; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.browsers (
    browser_id smallint NOT NULL,
    browser text NOT NULL
);


--
-- Name: browsers_browser_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.browsers_browser_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: browsers_browser_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.browsers_browser_id_seq OWNED BY land.browsers.browser_id;


--
-- Name: campaigns; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.campaigns (
    campaign_id bigint NOT NULL,
    campaign text NOT NULL
);


--
-- Name: campaigns_campaign_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.campaigns_campaign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: campaigns_campaign_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.campaigns_campaign_id_seq OWNED BY land.campaigns.campaign_id;


--
-- Name: contents; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.contents (
    content_id bigint NOT NULL,
    content text NOT NULL
);


--
-- Name: contents_content_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.contents_content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contents_content_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.contents_content_id_seq OWNED BY land.contents.content_id;


--
-- Name: cookies; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.cookies (
    cookie_id uuid DEFAULT public.uuid_generate_v4() NOT NULL
);


--
-- Name: creatives; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.creatives (
    creative_id bigint NOT NULL,
    creative text NOT NULL
);


--
-- Name: creatives_creative_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.creatives_creative_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: creatives_creative_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.creatives_creative_id_seq OWNED BY land.creatives.creative_id;


--
-- Name: device_types; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.device_types (
    device_type_id smallint NOT NULL,
    device_type text NOT NULL
);


--
-- Name: device_types_device_type_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.device_types_device_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: device_types_device_type_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.device_types_device_type_id_seq OWNED BY land.device_types.device_type_id;


--
-- Name: devices; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.devices (
    device_id bigint NOT NULL,
    device text NOT NULL
);


--
-- Name: devices_device_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.devices_device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: devices_device_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.devices_device_id_seq OWNED BY land.devices.device_id;


--
-- Name: domains; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.domains (
    domain_id bigint NOT NULL,
    domain text NOT NULL
);


--
-- Name: domains_domain_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.domains_domain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: domains_domain_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.domains_domain_id_seq OWNED BY land.domains.domain_id;


--
-- Name: event_types; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.event_types (
    event_type_id smallint NOT NULL,
    event_type text NOT NULL
);


--
-- Name: event_types_event_type_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.event_types_event_type_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_types_event_type_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.event_types_event_type_id_seq OWNED BY land.event_types.event_type_id;


--
-- Name: events; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.events (
    event_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    event_type_id smallint NOT NULL,
    visit_id uuid NOT NULL,
    meta json,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: experiments; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.experiments (
    experiment_id bigint NOT NULL,
    experiment text NOT NULL
);


--
-- Name: experiments_experiment_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.experiments_experiment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: experiments_experiment_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.experiments_experiment_id_seq OWNED BY land.experiments.experiment_id;


--
-- Name: http_methods; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.http_methods (
    http_method_id smallint NOT NULL,
    http_method text NOT NULL
);


--
-- Name: http_methods_http_method_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.http_methods_http_method_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: http_methods_http_method_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.http_methods_http_method_id_seq OWNED BY land.http_methods.http_method_id;


--
-- Name: keywords; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.keywords (
    keyword_id bigint NOT NULL,
    keyword text NOT NULL
);


--
-- Name: keywords_keyword_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.keywords_keyword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: keywords_keyword_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.keywords_keyword_id_seq OWNED BY land.keywords.keyword_id;


--
-- Name: match_types; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.match_types (
    match_type_id smallint NOT NULL,
    match_type text NOT NULL
);


--
-- Name: match_types_match_type_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.match_types_match_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: match_types_match_type_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.match_types_match_type_id_seq OWNED BY land.match_types.match_type_id;


--
-- Name: media; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.media (
    medium_id bigint NOT NULL,
    medium text NOT NULL
);


--
-- Name: media_medium_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.media_medium_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: media_medium_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.media_medium_id_seq OWNED BY land.media.medium_id;


--
-- Name: mime_types; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.mime_types (
    mime_type_id smallint NOT NULL,
    mime_type text NOT NULL
);


--
-- Name: mime_types_mime_type_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.mime_types_mime_type_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mime_types_mime_type_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.mime_types_mime_type_id_seq OWNED BY land.mime_types.mime_type_id;


--
-- Name: networks; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.networks (
    network_id smallint NOT NULL,
    network text NOT NULL
);


--
-- Name: networks_network_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.networks_network_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: networks_network_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.networks_network_id_seq OWNED BY land.networks.network_id;


--
-- Name: owners; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.owners (
    owner_id integer NOT NULL,
    owner text NOT NULL
);


--
-- Name: owners_owner_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.owners_owner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: owners_owner_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.owners_owner_id_seq OWNED BY land.owners.owner_id;


--
-- Name: ownerships; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.ownerships (
    ownership_id integer NOT NULL,
    owner_id integer NOT NULL,
    cookie_id uuid NOT NULL
);


--
-- Name: ownerships_ownership_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.ownerships_ownership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ownerships_ownership_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.ownerships_ownership_id_seq OWNED BY land.ownerships.ownership_id;


--
-- Name: pageviews; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.pageviews (
    pageview_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    visit_id uuid NOT NULL,
    path_id integer NOT NULL,
    query_string_id integer NOT NULL,
    mime_type_id smallint,
    http_method_id smallint NOT NULL,
    request_id uuid,
    click_id text,
    http_status integer,
    response_time integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: paths; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.paths (
    path_id bigint NOT NULL,
    path text NOT NULL
);


--
-- Name: paths_path_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.paths_path_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: paths_path_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.paths_path_id_seq OWNED BY land.paths.path_id;


--
-- Name: placements; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.placements (
    placement_id bigint NOT NULL,
    placement text NOT NULL
);


--
-- Name: placements_placement_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.placements_placement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: placements_placement_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.placements_placement_id_seq OWNED BY land.placements.placement_id;


--
-- Name: platforms; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.platforms (
    platform_id smallint NOT NULL,
    platform text NOT NULL
);


--
-- Name: platforms_platform_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.platforms_platform_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: platforms_platform_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.platforms_platform_id_seq OWNED BY land.platforms.platform_id;


--
-- Name: positions; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.positions (
    position_id smallint NOT NULL,
    "position" text NOT NULL
);


--
-- Name: positions_position_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.positions_position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: positions_position_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.positions_position_id_seq OWNED BY land.positions.position_id;


--
-- Name: query_strings; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.query_strings (
    query_string_id bigint NOT NULL,
    query_string text NOT NULL
);


--
-- Name: query_strings_query_string_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.query_strings_query_string_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: query_strings_query_string_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.query_strings_query_string_id_seq OWNED BY land.query_strings.query_string_id;


--
-- Name: referers; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.referers (
    referer_id integer NOT NULL,
    domain_id integer NOT NULL,
    path_id integer NOT NULL,
    query_string_id integer NOT NULL,
    attribution_id integer NOT NULL
);


--
-- Name: referers_referer_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.referers_referer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: referers_referer_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.referers_referer_id_seq OWNED BY land.referers.referer_id;


--
-- Name: response_times_by_path; Type: VIEW; Schema: land; Owner: -
--

CREATE VIEW land.response_times_by_path AS
 SELECT agg.path_id,
    agg.path,
    agg."avg response time (ms)"
   FROM ( SELECT p.path_id,
            p.path,
            round(avg(pv.response_time), 3) AS "avg response time (ms)"
           FROM (land.pageviews pv
             JOIN land.paths p USING (path_id))
          GROUP BY p.path_id, p.path) agg
  ORDER BY agg."avg response time (ms)" DESC;


--
-- Name: search_terms; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.search_terms (
    search_term_id bigint NOT NULL,
    search_term text NOT NULL
);


--
-- Name: search_terms_search_term_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.search_terms_search_term_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: search_terms_search_term_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.search_terms_search_term_id_seq OWNED BY land.search_terms.search_term_id;


--
-- Name: sources; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.sources (
    source_id bigint NOT NULL,
    source text NOT NULL
);


--
-- Name: sources_source_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.sources_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sources_source_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.sources_source_id_seq OWNED BY land.sources.source_id;


--
-- Name: subsources; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.subsources (
    subsource_id bigint NOT NULL,
    subsource text NOT NULL
);


--
-- Name: subsources_subsource_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.subsources_subsource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subsources_subsource_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.subsources_subsource_id_seq OWNED BY land.subsources.subsource_id;


--
-- Name: targets; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.targets (
    target_id bigint NOT NULL,
    target text NOT NULL
);


--
-- Name: targets_target_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.targets_target_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: targets_target_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.targets_target_id_seq OWNED BY land.targets.target_id;


--
-- Name: user_agent_types; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.user_agent_types (
    user_agent_type_id smallint NOT NULL,
    user_agent_type text NOT NULL
);


--
-- Name: user_agent_types_user_agent_type_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.user_agent_types_user_agent_type_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_agent_types_user_agent_type_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.user_agent_types_user_agent_type_id_seq OWNED BY land.user_agent_types.user_agent_type_id;


--
-- Name: user_agents; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.user_agents (
    user_agent_id integer NOT NULL,
    user_agent_type_id smallint,
    device_id integer,
    platform_id smallint,
    browser_id smallint,
    browser_version text,
    user_agent text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: user_agents_user_agent_id_seq; Type: SEQUENCE; Schema: land; Owner: -
--

CREATE SEQUENCE land.user_agents_user_agent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_agents_user_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: land; Owner: -
--

ALTER SEQUENCE land.user_agents_user_agent_id_seq OWNED BY land.user_agents.user_agent_id;


--
-- Name: visits; Type: TABLE; Schema: land; Owner: -
--

CREATE TABLE land.visits (
    visit_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    cookie_id uuid NOT NULL,
    user_agent_id integer NOT NULL,
    attribution_id integer NOT NULL,
    referer_id integer,
    owner_id integer,
    ip_address inet NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: ad_groups ad_group_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.ad_groups ALTER COLUMN ad_group_id SET DEFAULT nextval('land.ad_groups_ad_group_id_seq'::regclass);


--
-- Name: ad_types ad_type_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.ad_types ALTER COLUMN ad_type_id SET DEFAULT nextval('land.ad_types_ad_type_id_seq'::regclass);


--
-- Name: apps app_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.apps ALTER COLUMN app_id SET DEFAULT nextval('land.apps_app_id_seq'::regclass);


--
-- Name: attributions attribution_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions ALTER COLUMN attribution_id SET DEFAULT nextval('land.attributions_attribution_id_seq'::regclass);


--
-- Name: bid_match_types bid_match_type_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.bid_match_types ALTER COLUMN bid_match_type_id SET DEFAULT nextval('land.bid_match_types_bid_match_type_id_seq'::regclass);


--
-- Name: browsers browser_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.browsers ALTER COLUMN browser_id SET DEFAULT nextval('land.browsers_browser_id_seq'::regclass);


--
-- Name: campaigns campaign_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.campaigns ALTER COLUMN campaign_id SET DEFAULT nextval('land.campaigns_campaign_id_seq'::regclass);


--
-- Name: contents content_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.contents ALTER COLUMN content_id SET DEFAULT nextval('land.contents_content_id_seq'::regclass);


--
-- Name: creatives creative_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.creatives ALTER COLUMN creative_id SET DEFAULT nextval('land.creatives_creative_id_seq'::regclass);


--
-- Name: device_types device_type_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.device_types ALTER COLUMN device_type_id SET DEFAULT nextval('land.device_types_device_type_id_seq'::regclass);


--
-- Name: devices device_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.devices ALTER COLUMN device_id SET DEFAULT nextval('land.devices_device_id_seq'::regclass);


--
-- Name: domains domain_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.domains ALTER COLUMN domain_id SET DEFAULT nextval('land.domains_domain_id_seq'::regclass);


--
-- Name: event_types event_type_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.event_types ALTER COLUMN event_type_id SET DEFAULT nextval('land.event_types_event_type_id_seq'::regclass);


--
-- Name: experiments experiment_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.experiments ALTER COLUMN experiment_id SET DEFAULT nextval('land.experiments_experiment_id_seq'::regclass);


--
-- Name: http_methods http_method_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.http_methods ALTER COLUMN http_method_id SET DEFAULT nextval('land.http_methods_http_method_id_seq'::regclass);


--
-- Name: keywords keyword_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.keywords ALTER COLUMN keyword_id SET DEFAULT nextval('land.keywords_keyword_id_seq'::regclass);


--
-- Name: match_types match_type_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.match_types ALTER COLUMN match_type_id SET DEFAULT nextval('land.match_types_match_type_id_seq'::regclass);


--
-- Name: media medium_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.media ALTER COLUMN medium_id SET DEFAULT nextval('land.media_medium_id_seq'::regclass);


--
-- Name: mime_types mime_type_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.mime_types ALTER COLUMN mime_type_id SET DEFAULT nextval('land.mime_types_mime_type_id_seq'::regclass);


--
-- Name: networks network_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.networks ALTER COLUMN network_id SET DEFAULT nextval('land.networks_network_id_seq'::regclass);


--
-- Name: owners owner_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.owners ALTER COLUMN owner_id SET DEFAULT nextval('land.owners_owner_id_seq'::regclass);


--
-- Name: ownerships ownership_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.ownerships ALTER COLUMN ownership_id SET DEFAULT nextval('land.ownerships_ownership_id_seq'::regclass);


--
-- Name: paths path_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.paths ALTER COLUMN path_id SET DEFAULT nextval('land.paths_path_id_seq'::regclass);


--
-- Name: placements placement_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.placements ALTER COLUMN placement_id SET DEFAULT nextval('land.placements_placement_id_seq'::regclass);


--
-- Name: platforms platform_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.platforms ALTER COLUMN platform_id SET DEFAULT nextval('land.platforms_platform_id_seq'::regclass);


--
-- Name: positions position_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.positions ALTER COLUMN position_id SET DEFAULT nextval('land.positions_position_id_seq'::regclass);


--
-- Name: query_strings query_string_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.query_strings ALTER COLUMN query_string_id SET DEFAULT nextval('land.query_strings_query_string_id_seq'::regclass);


--
-- Name: referers referer_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.referers ALTER COLUMN referer_id SET DEFAULT nextval('land.referers_referer_id_seq'::regclass);


--
-- Name: search_terms search_term_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.search_terms ALTER COLUMN search_term_id SET DEFAULT nextval('land.search_terms_search_term_id_seq'::regclass);


--
-- Name: sources source_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.sources ALTER COLUMN source_id SET DEFAULT nextval('land.sources_source_id_seq'::regclass);


--
-- Name: subsources subsource_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.subsources ALTER COLUMN subsource_id SET DEFAULT nextval('land.subsources_subsource_id_seq'::regclass);


--
-- Name: targets target_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.targets ALTER COLUMN target_id SET DEFAULT nextval('land.targets_target_id_seq'::regclass);


--
-- Name: user_agent_types user_agent_type_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.user_agent_types ALTER COLUMN user_agent_type_id SET DEFAULT nextval('land.user_agent_types_user_agent_type_id_seq'::regclass);


--
-- Name: user_agents user_agent_id; Type: DEFAULT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.user_agents ALTER COLUMN user_agent_id SET DEFAULT nextval('land.user_agents_user_agent_id_seq'::regclass);


--
-- Name: ad_groups ad_groups_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.ad_groups
    ADD CONSTRAINT ad_groups_pkey PRIMARY KEY (ad_group_id);


--
-- Name: ad_types ad_types_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.ad_types
    ADD CONSTRAINT ad_types_pkey PRIMARY KEY (ad_type_id);


--
-- Name: apps apps_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.apps
    ADD CONSTRAINT apps_pkey PRIMARY KEY (app_id);


--
-- Name: attributions attributions_app_id_ad_type_id_ad_group_id_bid_match_type_i_key; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_app_id_ad_type_id_ad_group_id_bid_match_type_i_key UNIQUE (app_id, ad_type_id, ad_group_id, bid_match_type_id, campaign_id, content_id, creative_id, device_type_id, experiment_id, keyword_id, match_type_id, medium_id, network_id, placement_id, position_id, search_term_id, source_id, subsource_id, target_id);


--
-- Name: attributions attributions_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_pkey PRIMARY KEY (attribution_id);


--
-- Name: bid_match_types bid_match_types_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.bid_match_types
    ADD CONSTRAINT bid_match_types_pkey PRIMARY KEY (bid_match_type_id);


--
-- Name: browsers browsers_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.browsers
    ADD CONSTRAINT browsers_pkey PRIMARY KEY (browser_id);


--
-- Name: campaigns campaigns_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (campaign_id);


--
-- Name: contents contents_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.contents
    ADD CONSTRAINT contents_pkey PRIMARY KEY (content_id);


--
-- Name: cookies cookies_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.cookies
    ADD CONSTRAINT cookies_pkey PRIMARY KEY (cookie_id);


--
-- Name: creatives creatives_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.creatives
    ADD CONSTRAINT creatives_pkey PRIMARY KEY (creative_id);


--
-- Name: device_types device_types_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.device_types
    ADD CONSTRAINT device_types_pkey PRIMARY KEY (device_type_id);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (device_id);


--
-- Name: domains domains_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.domains
    ADD CONSTRAINT domains_pkey PRIMARY KEY (domain_id);


--
-- Name: event_types event_types_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.event_types
    ADD CONSTRAINT event_types_pkey PRIMARY KEY (event_type_id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_id);


--
-- Name: experiments experiments_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.experiments
    ADD CONSTRAINT experiments_pkey PRIMARY KEY (experiment_id);


--
-- Name: http_methods http_methods_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.http_methods
    ADD CONSTRAINT http_methods_pkey PRIMARY KEY (http_method_id);


--
-- Name: keywords keywords_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.keywords
    ADD CONSTRAINT keywords_pkey PRIMARY KEY (keyword_id);


--
-- Name: match_types match_types_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.match_types
    ADD CONSTRAINT match_types_pkey PRIMARY KEY (match_type_id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (medium_id);


--
-- Name: mime_types mime_types_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.mime_types
    ADD CONSTRAINT mime_types_pkey PRIMARY KEY (mime_type_id);


--
-- Name: networks networks_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.networks
    ADD CONSTRAINT networks_pkey PRIMARY KEY (network_id);


--
-- Name: owners owners_owner_key; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.owners
    ADD CONSTRAINT owners_owner_key UNIQUE (owner);


--
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (owner_id);


--
-- Name: ownerships ownerships_owner_id_cookie_id_key; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.ownerships
    ADD CONSTRAINT ownerships_owner_id_cookie_id_key UNIQUE (owner_id, cookie_id);


--
-- Name: ownerships ownerships_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.ownerships
    ADD CONSTRAINT ownerships_pkey PRIMARY KEY (ownership_id);


--
-- Name: pageviews pageviews_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.pageviews
    ADD CONSTRAINT pageviews_pkey PRIMARY KEY (pageview_id);


--
-- Name: paths paths_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.paths
    ADD CONSTRAINT paths_pkey PRIMARY KEY (path_id);


--
-- Name: placements placements_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.placements
    ADD CONSTRAINT placements_pkey PRIMARY KEY (placement_id);


--
-- Name: platforms platforms_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.platforms
    ADD CONSTRAINT platforms_pkey PRIMARY KEY (platform_id);


--
-- Name: positions positions_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (position_id);


--
-- Name: query_strings query_strings_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.query_strings
    ADD CONSTRAINT query_strings_pkey PRIMARY KEY (query_string_id);


--
-- Name: referers referers_domain_id_path_id_query_string_id_attribution_id_key; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.referers
    ADD CONSTRAINT referers_domain_id_path_id_query_string_id_attribution_id_key UNIQUE (domain_id, path_id, query_string_id, attribution_id);


--
-- Name: referers referers_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.referers
    ADD CONSTRAINT referers_pkey PRIMARY KEY (referer_id);


--
-- Name: search_terms search_terms_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.search_terms
    ADD CONSTRAINT search_terms_pkey PRIMARY KEY (search_term_id);


--
-- Name: sources sources_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (source_id);


--
-- Name: subsources subsources_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.subsources
    ADD CONSTRAINT subsources_pkey PRIMARY KEY (subsource_id);


--
-- Name: targets targets_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.targets
    ADD CONSTRAINT targets_pkey PRIMARY KEY (target_id);


--
-- Name: user_agent_types user_agent_types_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.user_agent_types
    ADD CONSTRAINT user_agent_types_pkey PRIMARY KEY (user_agent_type_id);


--
-- Name: user_agents user_agents_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.user_agents
    ADD CONSTRAINT user_agents_pkey PRIMARY KEY (user_agent_id);


--
-- Name: user_agents user_agents_user_agent_key; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.user_agents
    ADD CONSTRAINT user_agents_user_agent_key UNIQUE (user_agent);


--
-- Name: visits visits_pkey; Type: CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (visit_id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: ad_groups__u_ad_group; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX ad_groups__u_ad_group ON land.ad_groups USING btree (ad_group);


--
-- Name: ad_types__u_ad_type; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX ad_types__u_ad_type ON land.ad_types USING btree (ad_type);


--
-- Name: apps__u_app; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX apps__u_app ON land.apps USING btree (app);


--
-- Name: attributions_ad_group_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_ad_group_id_idx ON land.attributions USING btree (ad_group_id);


--
-- Name: attributions_ad_type_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_ad_type_id_idx ON land.attributions USING btree (ad_type_id);


--
-- Name: attributions_app_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_app_id_idx ON land.attributions USING btree (app_id);


--
-- Name: attributions_bid_match_type_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_bid_match_type_id_idx ON land.attributions USING btree (bid_match_type_id);


--
-- Name: attributions_campaign_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_campaign_id_idx ON land.attributions USING btree (campaign_id);


--
-- Name: attributions_content_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_content_id_idx ON land.attributions USING btree (content_id);


--
-- Name: attributions_creative_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_creative_id_idx ON land.attributions USING btree (creative_id);


--
-- Name: attributions_device_type_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_device_type_id_idx ON land.attributions USING btree (device_type_id);


--
-- Name: attributions_experiment_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_experiment_id_idx ON land.attributions USING btree (experiment_id);


--
-- Name: attributions_keyword_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_keyword_id_idx ON land.attributions USING btree (keyword_id);


--
-- Name: attributions_match_type_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_match_type_id_idx ON land.attributions USING btree (match_type_id);


--
-- Name: attributions_medium_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_medium_id_idx ON land.attributions USING btree (medium_id);


--
-- Name: attributions_network_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_network_id_idx ON land.attributions USING btree (network_id);


--
-- Name: attributions_placement_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_placement_id_idx ON land.attributions USING btree (placement_id);


--
-- Name: attributions_position_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_position_id_idx ON land.attributions USING btree (position_id);


--
-- Name: attributions_search_term_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_search_term_id_idx ON land.attributions USING btree (search_term_id);


--
-- Name: attributions_source_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_source_id_idx ON land.attributions USING btree (source_id);


--
-- Name: attributions_subsource_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_subsource_id_idx ON land.attributions USING btree (subsource_id);


--
-- Name: attributions_target_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX attributions_target_id_idx ON land.attributions USING btree (target_id);


--
-- Name: bid_match_types__u_bid_match_type; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX bid_match_types__u_bid_match_type ON land.bid_match_types USING btree (bid_match_type);


--
-- Name: browsers__u_browser; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX browsers__u_browser ON land.browsers USING btree (browser);


--
-- Name: campaigns__u_campaign; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX campaigns__u_campaign ON land.campaigns USING btree (campaign);


--
-- Name: contents__u_content; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX contents__u_content ON land.contents USING btree (content);


--
-- Name: creatives__u_creative; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX creatives__u_creative ON land.creatives USING btree (creative);


--
-- Name: device_types__u_device_type; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX device_types__u_device_type ON land.device_types USING btree (device_type);


--
-- Name: devices__u_device; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX devices__u_device ON land.devices USING btree (device);


--
-- Name: domains__u_domain; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX domains__u_domain ON land.domains USING btree (domain);


--
-- Name: event_types__u_event_type; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX event_types__u_event_type ON land.event_types USING btree (event_type);


--
-- Name: events_event_type_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX events_event_type_id_idx ON land.events USING btree (event_type_id);


--
-- Name: events_visit_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX events_visit_id_idx ON land.events USING btree (visit_id);


--
-- Name: experiments__u_experiment; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX experiments__u_experiment ON land.experiments USING btree (experiment);


--
-- Name: http_methods__u_http_method; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX http_methods__u_http_method ON land.http_methods USING btree (http_method);


--
-- Name: keywords__u_keyword; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX keywords__u_keyword ON land.keywords USING btree (keyword);


--
-- Name: match_types__u_match_type; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX match_types__u_match_type ON land.match_types USING btree (match_type);


--
-- Name: media__u_medium; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX media__u_medium ON land.media USING btree (medium);


--
-- Name: mime_types__u_mime_type; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX mime_types__u_mime_type ON land.mime_types USING btree (mime_type);


--
-- Name: networks__u_network; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX networks__u_network ON land.networks USING btree (network);


--
-- Name: pageviews_click_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX pageviews_click_id_idx ON land.pageviews USING btree (click_id);


--
-- Name: pageviews_path_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX pageviews_path_id_idx ON land.pageviews USING btree (path_id);


--
-- Name: pageviews_query_string_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX pageviews_query_string_id_idx ON land.pageviews USING btree (query_string_id);


--
-- Name: pageviews_request_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX pageviews_request_id_idx ON land.pageviews USING btree (request_id);


--
-- Name: pageviews_visit_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX pageviews_visit_id_idx ON land.pageviews USING btree (visit_id);


--
-- Name: paths__u_path; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX paths__u_path ON land.paths USING btree (path);


--
-- Name: placements__u_placement; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX placements__u_placement ON land.placements USING btree (placement);


--
-- Name: platforms__u_platform; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX platforms__u_platform ON land.platforms USING btree (platform);


--
-- Name: positions__u_position; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX positions__u_position ON land.positions USING btree ("position");


--
-- Name: query_strings__u_query_string; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX query_strings__u_query_string ON land.query_strings USING btree (query_string);


--
-- Name: referers_attribution_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX referers_attribution_id_idx ON land.referers USING btree (attribution_id);


--
-- Name: referers_domain_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX referers_domain_id_idx ON land.referers USING btree (domain_id);


--
-- Name: referers_path_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX referers_path_id_idx ON land.referers USING btree (path_id);


--
-- Name: referers_query_string_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX referers_query_string_id_idx ON land.referers USING btree (query_string_id);


--
-- Name: search_terms__u_search_term; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX search_terms__u_search_term ON land.search_terms USING btree (search_term);


--
-- Name: sources__u_source; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX sources__u_source ON land.sources USING btree (source);


--
-- Name: subsources__u_subsource; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX subsources__u_subsource ON land.subsources USING btree (subsource);


--
-- Name: targets__u_target; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX targets__u_target ON land.targets USING btree (target);


--
-- Name: user_agent_types__u_user_agent_type; Type: INDEX; Schema: land; Owner: -
--

CREATE UNIQUE INDEX user_agent_types__u_user_agent_type ON land.user_agent_types USING btree (user_agent_type);


--
-- Name: user_agents_browser_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX user_agents_browser_id_idx ON land.user_agents USING btree (browser_id);


--
-- Name: user_agents_device_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX user_agents_device_id_idx ON land.user_agents USING btree (device_id);


--
-- Name: user_agents_platform_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX user_agents_platform_id_idx ON land.user_agents USING btree (platform_id);


--
-- Name: visits_attribution_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX visits_attribution_id_idx ON land.visits USING btree (attribution_id);


--
-- Name: visits_cookie_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX visits_cookie_id_idx ON land.visits USING btree (cookie_id);


--
-- Name: visits_owner_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX visits_owner_id_idx ON land.visits USING btree (owner_id);


--
-- Name: visits_referer_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX visits_referer_id_idx ON land.visits USING btree (referer_id);


--
-- Name: visits_user_agent_id_idx; Type: INDEX; Schema: land; Owner: -
--

CREATE INDEX visits_user_agent_id_idx ON land.visits USING btree (user_agent_id);


--
-- Name: attributions attributions_ad_group_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_ad_group_id_fkey FOREIGN KEY (ad_group_id) REFERENCES land.ad_groups(ad_group_id);


--
-- Name: attributions attributions_ad_type_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_ad_type_id_fkey FOREIGN KEY (ad_type_id) REFERENCES land.ad_types(ad_type_id);


--
-- Name: attributions attributions_app_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_app_id_fkey FOREIGN KEY (app_id) REFERENCES land.apps(app_id);


--
-- Name: attributions attributions_bid_match_type_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_bid_match_type_id_fkey FOREIGN KEY (bid_match_type_id) REFERENCES land.bid_match_types(bid_match_type_id);


--
-- Name: attributions attributions_campaign_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_campaign_id_fkey FOREIGN KEY (campaign_id) REFERENCES land.campaigns(campaign_id);


--
-- Name: attributions attributions_content_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_content_id_fkey FOREIGN KEY (content_id) REFERENCES land.contents(content_id);


--
-- Name: attributions attributions_creative_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_creative_id_fkey FOREIGN KEY (creative_id) REFERENCES land.creatives(creative_id);


--
-- Name: attributions attributions_device_type_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_device_type_id_fkey FOREIGN KEY (device_type_id) REFERENCES land.device_types(device_type_id);


--
-- Name: attributions attributions_experiment_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_experiment_id_fkey FOREIGN KEY (experiment_id) REFERENCES land.experiments(experiment_id);


--
-- Name: attributions attributions_keyword_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_keyword_id_fkey FOREIGN KEY (keyword_id) REFERENCES land.keywords(keyword_id);


--
-- Name: attributions attributions_match_type_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_match_type_id_fkey FOREIGN KEY (match_type_id) REFERENCES land.match_types(match_type_id);


--
-- Name: attributions attributions_medium_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_medium_id_fkey FOREIGN KEY (medium_id) REFERENCES land.media(medium_id);


--
-- Name: attributions attributions_network_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_network_id_fkey FOREIGN KEY (network_id) REFERENCES land.networks(network_id);


--
-- Name: attributions attributions_placement_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_placement_id_fkey FOREIGN KEY (placement_id) REFERENCES land.placements(placement_id);


--
-- Name: attributions attributions_position_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_position_id_fkey FOREIGN KEY (position_id) REFERENCES land.positions(position_id);


--
-- Name: attributions attributions_search_term_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_search_term_id_fkey FOREIGN KEY (search_term_id) REFERENCES land.search_terms(search_term_id);


--
-- Name: attributions attributions_source_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_source_id_fkey FOREIGN KEY (source_id) REFERENCES land.sources(source_id);


--
-- Name: attributions attributions_subsource_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_subsource_id_fkey FOREIGN KEY (subsource_id) REFERENCES land.subsources(subsource_id);


--
-- Name: attributions attributions_target_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.attributions
    ADD CONSTRAINT attributions_target_id_fkey FOREIGN KEY (target_id) REFERENCES land.targets(target_id);


--
-- Name: events events_event_type_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.events
    ADD CONSTRAINT events_event_type_id_fkey FOREIGN KEY (event_type_id) REFERENCES land.event_types(event_type_id);


--
-- Name: events events_visit_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.events
    ADD CONSTRAINT events_visit_id_fkey FOREIGN KEY (visit_id) REFERENCES land.visits(visit_id);


--
-- Name: ownerships ownerships_cookie_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.ownerships
    ADD CONSTRAINT ownerships_cookie_id_fkey FOREIGN KEY (cookie_id) REFERENCES land.cookies(cookie_id);


--
-- Name: ownerships ownerships_owner_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.ownerships
    ADD CONSTRAINT ownerships_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES land.owners(owner_id);


--
-- Name: pageviews pageviews_http_method_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.pageviews
    ADD CONSTRAINT pageviews_http_method_id_fkey FOREIGN KEY (http_method_id) REFERENCES land.http_methods(http_method_id);


--
-- Name: pageviews pageviews_mime_type_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.pageviews
    ADD CONSTRAINT pageviews_mime_type_id_fkey FOREIGN KEY (mime_type_id) REFERENCES land.mime_types(mime_type_id);


--
-- Name: pageviews pageviews_path_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.pageviews
    ADD CONSTRAINT pageviews_path_id_fkey FOREIGN KEY (path_id) REFERENCES land.paths(path_id);


--
-- Name: pageviews pageviews_query_string_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.pageviews
    ADD CONSTRAINT pageviews_query_string_id_fkey FOREIGN KEY (query_string_id) REFERENCES land.query_strings(query_string_id);


--
-- Name: pageviews pageviews_visit_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.pageviews
    ADD CONSTRAINT pageviews_visit_id_fkey FOREIGN KEY (visit_id) REFERENCES land.visits(visit_id);


--
-- Name: referers referers_attribution_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.referers
    ADD CONSTRAINT referers_attribution_id_fkey FOREIGN KEY (attribution_id) REFERENCES land.attributions(attribution_id);


--
-- Name: referers referers_domain_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.referers
    ADD CONSTRAINT referers_domain_id_fkey FOREIGN KEY (domain_id) REFERENCES land.domains(domain_id);


--
-- Name: referers referers_path_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.referers
    ADD CONSTRAINT referers_path_id_fkey FOREIGN KEY (path_id) REFERENCES land.paths(path_id);


--
-- Name: referers referers_query_string_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.referers
    ADD CONSTRAINT referers_query_string_id_fkey FOREIGN KEY (query_string_id) REFERENCES land.query_strings(query_string_id);


--
-- Name: user_agents user_agents_browser_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.user_agents
    ADD CONSTRAINT user_agents_browser_id_fkey FOREIGN KEY (browser_id) REFERENCES land.browsers(browser_id);


--
-- Name: user_agents user_agents_device_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.user_agents
    ADD CONSTRAINT user_agents_device_id_fkey FOREIGN KEY (device_id) REFERENCES land.devices(device_id);


--
-- Name: user_agents user_agents_platform_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.user_agents
    ADD CONSTRAINT user_agents_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES land.platforms(platform_id);


--
-- Name: user_agents user_agents_user_agent_type_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.user_agents
    ADD CONSTRAINT user_agents_user_agent_type_id_fkey FOREIGN KEY (user_agent_type_id) REFERENCES land.user_agent_types(user_agent_type_id);


--
-- Name: visits visits_attribution_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.visits
    ADD CONSTRAINT visits_attribution_id_fkey FOREIGN KEY (attribution_id) REFERENCES land.attributions(attribution_id);


--
-- Name: visits visits_cookie_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.visits
    ADD CONSTRAINT visits_cookie_id_fkey FOREIGN KEY (cookie_id) REFERENCES land.cookies(cookie_id);


--
-- Name: visits visits_owner_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.visits
    ADD CONSTRAINT visits_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES land.owners(owner_id);


--
-- Name: visits visits_referer_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.visits
    ADD CONSTRAINT visits_referer_id_fkey FOREIGN KEY (referer_id) REFERENCES land.referers(referer_id);


--
-- Name: visits visits_user_agent_id_fkey; Type: FK CONSTRAINT; Schema: land; Owner: -
--

ALTER TABLE ONLY land.visits
    ADD CONSTRAINT visits_user_agent_id_fkey FOREIGN KEY (user_agent_id) REFERENCES land.user_agents(user_agent_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20200103012916');


