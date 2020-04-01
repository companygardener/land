# frozen_string_literal: true

module Land
  class Referer < ApplicationRecord
    include TableName

    lookup_for :domain,       class_name: Domain
    lookup_for :path,         class_name: Path
    lookup_for :query_string, class_name: QueryString

    def url
      uri.to_s
    end

    def uri
      URI.join("https://#{domain}", path)
    end
  end
end
