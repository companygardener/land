module Land
  module Action
    extend ActiveSupport::Concern

    included do
      prepend_around_action :track_with_land!
    end

    # Use @land to avoid conflicts in controller namespace
    def track_with_land!
      yield && return if untracked?

      begin
        @land = Tracker.for(self)
        @land.track
      rescue => e
        begin
          Rails.logger.error e

          if defined?(NewRelic::Agent) && NewRelic::Agent.respond_to?(:notice_error)
            NewRelic::Agent.notice_error(e)
          end
        rescue
          # eat this error
        end
      end

      begin
        yield
      rescue => e
        @land.status = ActionDispatch::ExceptionWrapper.status_code_for_exception(e.class.name)
        raise e
      ensure
        begin
          @land.save
        rescue => e
          begin
            Rails.logger.error e

            if defined?(NewRelic::Agent) && NewRelic::Agent.respond_to?(:notice_error)
              NewRelic::Agent.notice_error(e)
            end
          rescue
            # bubble controller error, not this one
          end
        end
      end
    end

    def untracked?
      untracked_path? || untracked_ip?
    end

    def untracked_path?
      Land.config.untracked_paths.include? request.fullpath
    end

    def untracked_ip?
      Land.config.untracked_ips.include? request.remote_ip
    end
  end
end
