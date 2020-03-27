module Land
  class Medium < ApplicationRecord
    include TableName

    lookup_by :medium, cache: 50, find_or_create: true

    has_many :attributions
  end
end
