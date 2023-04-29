module Land
  class MediumIdentifier < ApplicationRecord

    include TableName

    lookup_by :medium_identifier, cache: 50, find_or_create: true

    has_many :attributions
  end
end
