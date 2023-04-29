module Land
  class ContentIdentifier < ApplicationRecord

    include TableName

    lookup_by :content_identifier, cache: 50, find_or_create: true

    has_many :attributions
  end
end
