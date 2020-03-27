module Land
  class Target < ApplicationRecord
    include TableName

    lookup_by :target, cache: 50, find_or_create: true

    has_many :attributions
  end
end
