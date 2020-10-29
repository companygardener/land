# frozen_string_literal: true

require 'rails_helper'

module Land
  describe 'Requests', type: :request do
    before do
      get root_path
    end

    context 'for pageviews' do
      it 'records request id' do
        expect(Land::Pageview.last.request_id).to eql(response.request.request_id)
      end
    end

    context 'for events' do
      it 'records request id' do
        expect(Land::Event.last.request_id).to eql(response.request.request_id)
      end
    end
  end
end
