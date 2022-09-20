class AddIndexesToEvents < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    add_index "#{Land.config.schema}.events", :created_at, algorithm: :concurrently
    add_index "#{Land.config.schema}.events", :pageview_id, algorithm: :concurrently
  end
end
