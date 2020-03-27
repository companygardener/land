module Land
  class Pageview < ApplicationRecord
    include TableName
    self.record_timestamps = false

    # optional: true is misleading
    # visit_id is actually required, but its validity is enforced by the db.
    # Without this Rails loads the visit record when saving the pageview.
    # This removes the unnecessary query.
    belongs_to :visit, optional: true

    lookup_for :mime_type,    class_name: MimeType
    lookup_for :http_method,  class_name: HttpMethod
    lookup_for :path,         class_name: Path
    lookup_for :query_string, class_name: QueryString

    after_initialize do
      self.id ||= SecureRandom.uuid
    end
  end
end
