module Land
  class Path < ApplicationRecord
    include TableName

    lookup_by :path, cache: 50, find_or_create: true

    has_many :page_views
    has_many :referers
  end
end
