class EventsRequestId < ActiveRecord::Migration[6.0]
  def change
    add_column 'land.events', :request_id, :uuid

    execute <<-SQL
      UPDATE land.events e
      SET
        request_id = p.request_id
      FROM land.events e1
        JOIN land.pageviews p using (pageview_id)
      WHERE
        e.pageview_id = p.pageview_id
        AND p.request_id IS NOT NULL
        AND e1.request_id IS NULL
    SQL
  end
end
