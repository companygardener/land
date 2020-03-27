module Land
  class Placement < ApplicationRecord
    include TableName

    lookup_by :placement, cache: 50, find_or_create: true

    has_many :attributions
  end
end
