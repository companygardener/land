module Land
  class Source < ApplicationRecord
    include TableName

    lookup_by :source, cache: 250, find_or_create: true

    has_many :attributions
  end
end
