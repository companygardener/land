module Land
  class Brand < ApplicationRecord
    include TableName

    lookup_by :brand, cache: 50, find_or_create: true

    has_many :attributions
  end
end
