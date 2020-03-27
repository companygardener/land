module Land
  class Network < ApplicationRecord
    include TableName

    lookup_by :network, cache: 50, find_or_create: true

    has_many :attributions
  end
end
