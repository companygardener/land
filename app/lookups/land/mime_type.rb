module Land
  class MimeType < ApplicationRecord
    include TableName

    lookup_by :mime_type, cache: 50, find_or_create: true

    has_many :pageviews
  end
end
