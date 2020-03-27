module Land
  class App < ApplicationRecord
    include TableName

    lookup_by :app, cache: 50, find_or_create: true

    has_many :attributions
  end
end
