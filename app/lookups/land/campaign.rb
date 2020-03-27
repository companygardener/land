module Land
  class Campaign < ApplicationRecord

    include TableName

    lookup_by :campaign, cache: 50, find_or_create: true

    has_many :attributions
  end
end
