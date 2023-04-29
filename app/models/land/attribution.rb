# frozen_string_literal: true

module Land
  class Attribution < ApplicationRecord
    include TableName

    KEYS = %w[
      ad_type
      ad_group
      affiliate
      app
      bid_match_type
      brand
      campaign
      campaign_identifier
      content
      content_identifier
      creative
      device_type
      experiment
      keyword
      match_type
      medium
      medium_identifier
      network
      placement
      position
      search_term
      source
      subsource
      target
    ]

    self.record_timestamps = false

    KEYS.each do |key|
      lookup_for key.to_sym, class_name: "Land::#{key.classify}".constantize
    end

    has_many :visits

    class << self
      def transform(params)
        hash = params.slice(*KEYS)

        filter = {}

        hash.each do |k, v|
          begin
            filter[k.foreign_key] = "Land::#{k.classify}".constantize[v]
          rescue ActiveRecord::StatementInvalid => e
            transform_overflow_or_bad_param_value!(filter, k, v, e)
          rescue StandardError => e
            transform_bad_param_value!(filter, k, v, e)
          end
        end

        filter
      end

      def lookup(params)
        where(transform(params)).first_or_create
      rescue ActiveRecord::RecordNotUnique
        retry
      end

      def digest(params)
        Digest::SHA2.base64digest transform(params).values.compact.map(&:name).sort.join("\n")
      end

      # instead of killing the attribution altogether, just record why this param can't be captured as-is
      def transform_bad_param_value!(filter, key, val, err)
        filter[key.foreign_key] = "Land::#{key.classify}".constantize[[err.class, err.message, val.dump].join(':')]
      end

      # this is probably a value that exceeds the postgres index limit, so just note that and hash it instead of breaking,
      # falling back to general bad param handling if it's _not_ that
      def transform_overflow_or_bad_param_value!(filter, key, val, err)
        if err.message.starts_with?('PG::ProgramLimitExceeded')
          filter[key.foreign_key] = "Land::#{key.classify}".constantize[['PG::ProgramLimitExceeded', Digest::MD5.hexdigest(val)].join(':')]
        else
          transform_bad_param_value!(filter, key, val, err)
        end
      end
    end
  end
end
