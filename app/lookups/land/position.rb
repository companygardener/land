module Land
  class Position < ApplicationRecord
    include TableName

    lookup_by :position, cache: 50, find_or_create: true

    has_many :attributions
  end
end
