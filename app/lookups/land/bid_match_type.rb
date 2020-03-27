module Land
  class BidMatchType < ApplicationRecord
    include TableName

    lookup_by :bid_match_type, cache: 50, find_or_create: true

    has_many :attributions
  end
end
