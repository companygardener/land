module Land
  class Subsource < ApplicationRecord
    include TableName

    lookup_by :subsource, cache: 1000, find_or_create: true

    has_many :attributions
  end
end
