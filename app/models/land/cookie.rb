module Land
  class Cookie < ApplicationRecord
    include TableName

    lookup_by :cookie_id, cache: 100, find: true

    has_many :ownerships
    has_many :visits

    after_initialize do
      self.id ||= SecureRandom.uuid
    end
  end
end
