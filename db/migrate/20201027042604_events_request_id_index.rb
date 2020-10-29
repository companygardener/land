class EventsRequestIdIndex < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_index 'land.events', :request_id, algorithm: :concurrently
  end
end
