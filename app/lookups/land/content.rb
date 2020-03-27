module Land
  class Content < ApplicationRecord
    include TableName

    lookup_by :content, cache: 50, find_or_create: true

    has_many :attributions
  end
end
