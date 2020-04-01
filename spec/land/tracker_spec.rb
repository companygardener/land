# frozen_string_literal: true

require 'rails_helper'

module Land
  describe Land::Tracker do
    let(:user_agent)     { 'Mozilla/5.0 (Mobile; rv:10.0) Gecko/20100101 Firefox/17.0' }
    let(:user_agent_bot) { 'Googlebot/2.1 (+http://www.google.com/bot.html) ' }

    let(:referer)        { 'https://google.com/valid' }
    let(:format)         { double('format', html?: true) }
    let(:request)        { double('request', query_parameters: {}, user_agent: user_agent, referer: referer, format: format) }
    let(:controller)     { double('controller', request: request ) }

    describe '#for' do
      describe 'blank user agent' do
        let(:user_agent) { nil }

        it 'defaults to UserTracker' do
          expect(Land::Tracker.for(controller)).to be_a(Land::Trackers::UserTracker)
        end
      end
    end
  end
end
