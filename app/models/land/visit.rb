module Land
  class Visit < ApplicationRecord
    include TableName

    belongs_to :attribution
    belongs_to :cookie
    belongs_to :user_agent
    belongs_to :referer, optional: true

    lookup_for :owner, class_name: Owner

    has_many :pageviews

    after_initialize do
      self.id ||= SecureRandom.uuid
    end
  end
end
