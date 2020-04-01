# frozen_string_literal: true

module Land
  class Attribution < ApplicationRecord
    include TableName

    KEYS = %w[
      ad_type
      ad_group
      app
      bid_match_type
      campaign
      content
      creative
      device_type
      experiment
      keyword
      match_type
      medium
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
          filter[k.foreign_key] = "Land::#{k.classify}".constantize[v]
        end

        filter
      end

      def lookup(params)
        where(transform(params)).first_or_create
      rescue ActiveRecord::RecordNotUnique
        retry
      end

      def digest(params)
        Digest::SHA2.base64digest transform(params).values.map(&:name).sort.join("\n")
      end
    end
  end
end
