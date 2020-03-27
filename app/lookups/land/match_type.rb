module Land
  class MatchType < ApplicationRecord
    include TableName

    lookup_by :match_type, cache: 50, find_or_create: true

    has_many :attributions
  end
end
