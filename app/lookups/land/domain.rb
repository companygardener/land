module Land
  class Domain < ApplicationRecord
    include TableName

    lookup_by :domain, cache: 50, find_or_create: true, allow_blank: true

    has_many :referers
  end
end
