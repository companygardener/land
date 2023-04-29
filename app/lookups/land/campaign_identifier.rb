module Land
  class CampaignIdentifier < ApplicationRecord

    include TableName

    lookup_by :campaign_identifier, cache: 50, find_or_create: true

    has_many :attributions
  end
end
