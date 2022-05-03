class AddIndexCreatedAtToPageviews < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_index "#{Land.config.schema}.pageviews", :created_at, algorithm: :concurrently
  end
end
