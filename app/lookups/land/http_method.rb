module Land
  class HttpMethod < ApplicationRecord
    include TableName

    lookup_by :http_method, cache: 50, find_or_create: true

    has_many :pageviews
  end
end
