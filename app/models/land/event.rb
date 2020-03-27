module Land
  class Event < ApplicationRecord
    include TableName
    self.record_timestamps = false

    lookup_for :event_type, class_name: EventType, symbolize: true

    belongs_to :pageview, required: false
  end
end
