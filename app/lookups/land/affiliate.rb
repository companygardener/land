module Land
  class Affiliate < ApplicationRecord
    include TableName

    lookup_by :affiliate, cache: 50, find_or_create: true

    has_many :attributions
  end
end
