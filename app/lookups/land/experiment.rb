module Land
  class Experiment < ApplicationRecord
    include TableName

    lookup_by :experiment, cache: 50, find_or_create: true

    has_many :attributions
  end
end
