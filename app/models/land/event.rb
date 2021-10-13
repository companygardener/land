module Land
  class Event < ApplicationRecord
    include TableName
    self.record_timestamps = false

    lookup_for :event_type, class_name: EventType, symbolize: true
    
    belongs_to :event_type, required: false
    belongs_to :pageview, required: false

    scope :by_event_type, -> event_type {find_by(event_type: event_type)}
  end
end
