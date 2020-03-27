module Land
  class Creative < ApplicationRecord
    include TableName

    lookup_by :creative, cache: 50, find_or_create: true

    has_many :attributions
  end
end
