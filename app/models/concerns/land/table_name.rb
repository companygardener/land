# frozen_string_literal: true

module Land
  module TableName
    extend ActiveSupport::Concern

    included do
      self.table_name = "#{Land.config.schema}.#{model_name.element.pluralize}"
    end
  end
end
