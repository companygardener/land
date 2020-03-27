module Land
  module Trackers
    class NoopTracker < Tracker
      def save
      end
    end
  end
end
