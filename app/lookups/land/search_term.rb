module Land
  class SearchTerm < ApplicationRecord
    include TableName

    lookup_by :search_term, cache: 50, find_or_create: true

    has_many :attributions
  end
end
