class AddPageviewIdToEvents < ActiveRecord::Migration[6.0]
  def change
    conn = ActiveRecord::Base.connection
    old_search_path = conn.schema_search_path
    conn.execute "SET search_path TO land, #{conn.schema_search_path}"
    
    unless column_exists? :events, :pageview_id
      add_column :events, :pageview_id, :uuid
      add_foreign_key :events, :pageviews, column: :pageview_id, primary_key: :pageview_id
    end

    conn.execute "SET search_path TO #{old_search_path}"
  end
end
