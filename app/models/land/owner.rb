module Land
  class Owner < ApplicationRecord
    include TableName

    lookup_by :owner, cache: 50, find_or_create: true

    has_many :ownerships
    has_many :visits
  end
end
