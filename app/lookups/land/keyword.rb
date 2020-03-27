module Land
  class Keyword < ApplicationRecord
    include TableName

    lookup_by :keyword, cache: 50, find_or_create: true

    has_many :attributions
  end
end
