module Land
  class Ownership < ApplicationRecord
    include TableName

    lookup_for :cookie, class_name: Cookie
    lookup_for :owner,  class_name: Owner
  end
end
