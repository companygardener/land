module Land
  class AdType < ApplicationRecord
    include TableName

    lookup_by :ad_type, cache: 50, find_or_create: true

    has_many :attributions
  end
end
