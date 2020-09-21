module Land
  class QueryString < ApplicationRecord
    include TableName

    lookup_by :query_string, cache: 50, find_or_create: true, allow_blank: true

    has_many :pageviews
    has_many :referers
  end
end
