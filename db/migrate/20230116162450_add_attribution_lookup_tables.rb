class AddAttributionLookupTables < ActiveRecord::Migration[7.0]
  QUERY_PARAMS = %w[
    content_identifier
    campaign_identifier
    medium_identifier
  ]

  def schema
    Land.config.schema
  end

  def up
    with_options schema: schema do |t|
      t.create_lookup_tables(*QUERY_PARAMS.map(&:pluralize))
    end

    add_column 'land.attributions', :campaign_identifier_id, :integer
    add_column 'land.attributions', :medium_identifier_id, :integer
    add_column 'land.attributions', :content_identifier_id, :integer
  end

  def down
    with_options schema: schema do |t|
      QUERY_PARAMS.each do |table|
        t.drop_table("#{schema}.#{table.pluralize}")
      end
    end

    remove_column 'land.attributions', :campaign_identifier_id
    remove_column 'land.attributions', :medium_identifier_id
    remove_column 'land.attributions', :content_identifier_id
  end
end
