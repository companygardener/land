# frozen_string_literal: true

module Land
  module Trackers
    class UserTracker < Tracker
      attr_reader :pageview

      def track
        load
        cookie
        record_visit
      end

      def load
        hash = session[:land] || {}

        @cookie_id = cookies[:land]

        # KEYS is used to compact the key name in the session to save space
        @visit_id         = hash[KEYS[:visit_id]]
        @last_visit_time  = hash[KEYS[:visit_time]].try :to_time
        @user_agent_hash  = hash[KEYS[:user_agent_hash]]
        @attribution_hash = hash[KEYS[:attribution_hash]]
        @referer_hash     = hash[KEYS[:referer_hash]]
      end

      def record_pageview
        current_time = Time.now

        @pageview = Pageview.create do |p|
          p.path          = request.path.to_s

          p.http_method   = request.method
          p.mime_type     = request.media_type || request.format.to_s
          p.query_string  = untracked_params.to_query
          p.request_id    = request.uuid

          p.click_id      = tracking_params['click_id']

          p.http_status   = status || response.status

          p.visit_id      = @visit_id

          p.created_at    = current_time
          p.response_time = (current_time - @start_time) * 1000
        end
      end

      def save
        record_pageview

        events.each { |e| e.pageview = pageview; e.save! }

        session[:land] = {
          KEYS[:visit_id]         => @visit_id,
          KEYS[:visit_time]       => Time.current,
          KEYS[:user_agent_hash]  => user_agent_hash,
          KEYS[:attribution_hash] => attribution_changed? ? attribution_hash : @attribution_hash,
          KEYS[:referer_hash]     => referer_changed?     ? referer_hash     : @referer_hash
        }
      end

      def identify(identifier)
        visit = @visit || Visit.find(@visit_id)

        owner = Owner[identifier]

        visit.owner = owner
        visit.save!

        begin
          Ownership.where(cookie_id: @cookie_id, owner_id: owner).first_or_create
        rescue ActiveRecord::RecordNotUnique
          retry
        end
      end
    end
  end
end
