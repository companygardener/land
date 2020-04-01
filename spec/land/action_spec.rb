# frozen_string_literal: true

require 'rails_helper'

module Land
  describe Land::Action, type: :controller do
    controller(::ActionController::Base) do
      include Land::Action
      include Land::Helper

      def test
        render plain: "200 OK"
      end

      def fail
        raise RuntimeError
      end

      def login
        land.identify 'Joe Somebody'

        render plain: "200 OK"
      end
    end

    before do
      routes.draw do
        get 'test'  => 'anonymous#test'
        get 'fail'  => 'anonymous#fail'
        get 'login' => 'anonymous#login'
      end
    end

    describe 'track_with_land!' do
      it 'tracks visits' do
        expect { get :test }.to change { Visit.count }.by 1

        visit = controller.land.visit

        expect(visit.ip_address.to_s).to eq "0.0.0.0"
        expect(visit.user_agent.name).to eq "Rails Testing"
      end

      it 'tracks pageviews' do
        uuid = SecureRandom.uuid

        request.headers['X-Request-Id'] = uuid

        expect { get :test }.to change { Pageview.count }.by 1

        pageview = controller.land.pageview

        expect(pageview.path).to eq "/test"
        expect(pageview.query_string).to be_blank
        expect(pageview.http_status).to  eq 200

        # @todo is combustion running the ActionDispatch::RequestId middleware?
        # expect(pageview.request_id).to eq uuid
      end

      it 'tracks referers' do
        request.headers['HTTP_REFERER'] = "https://google.com/results?q=needle"

        get :test

        visit = controller.land.visit

        expect(Referer.count).to eq 1

        expect(visit.referer.domain).to       eq "google.com"
        expect(visit.referer.path).to         eq "/results"
        expect(visit.referer.query_string).to eq "q=needle"
      end

      it 'sets cookies' do
        expect { get :test }.to change { Cookie.count }.by 1

        expect(response.cookies).to have_key "land"
        expect(response.cookies["land"]).to eq Visit.last.cookie.id
      end

      it 'returns valid cookies' do
        good_cookie = Cookie.create.id

        cookies['land'] = good_cookie

        get :test

        expect(response.cookies['land']).to eq good_cookie
      end

      it 'ignores invalid cookies' do
        bad_cookie = SecureRandom.uuid

        cookies['land'] = bad_cookie

        get :test

        expect(response.cookies["land"]).to_not eq bad_cookie
      end

      it 'tracks failures' do
        expect { get :fail }.to raise_error(RuntimeError)

        expect(controller.land.pageview.http_status).to eq 500
      end

      it 'identifies owners' do
        expect { get :login }.to change { Ownership.count }.by 1

        expect(controller.land.visit.owner).to eq 'Joe Somebody'
      end

      it 'tracks attributions' do
        click_id = SecureRandom.uuid

        params = {
          ad_group:       'testgroup',
          ad_type:        'pe',
          aid:            'testapp',
          bid_match_type: 'bb',
          campaign:       'testing',
          click_id:       click_id,
          content:        'testcontent',
          creative:       'v1',
          device_type:    'c',
          experiment:     'big button',
          keyword:        'testkeyword',
          match_type:     'b',
          medium:         'ppc',
          network:        'testaffiliate',
          placement:      'sidebar',
          position:       '3',
          search_term:    'test search',
          source:         'google',
          subsource:      'youtube',
          target:         'destroyed'
        }

        expect { Land::Attribution.digest(params.stringify_keys) }.to_not raise_error

        get :test, params: params

        a = Attribution.last

        expect(a.app).to            eq 'testapp'
        expect(a.ad_type).to        eq 'product_extensions'
        expect(a.ad_group).to       eq 'testgroup'
        expect(a.bid_match_type).to eq 'bidded broad'
        expect(a.campaign).to       eq 'testing'
        expect(a.content).to        eq 'testcontent'
        expect(a.creative).to       eq 'v1'
        expect(a.device_type).to    eq 'computer'
        expect(a.experiment).to     eq 'big button'
        expect(a.keyword).to        eq 'testkeyword'
        expect(a.match_type).to     eq 'broad'
        expect(a.medium).to         eq 'ppc'
        expect(a.network).to        eq 'testaffiliate'
        expect(a.placement).to      eq 'sidebar'
        expect(a.position).to       eq '3'
        expect(a.search_term).to    eq 'test search'
        expect(a.source).to         eq 'google'
        expect(a.subsource).to      eq 'youtube'
        expect(a.target).to         eq 'destroyed'

        expect(controller.land.pageview.click_id).to eq click_id
      end

      { 'pe'  => 'product_extensions',
        'pla' => 'product_listing'
      }.each do |key, value|
        it "expands ad_type: #{key}" do
          get :test, params: { ad_type: key }

          expect(Attribution.last.ad_type).to eq value
        end
      end

      {
        'bb' => 'bidded broad',
        'bc' => 'bidded content',
        'be' => 'bidded exact',
        'bp' => 'bidded phrase'
      }.each do |key, value|
        it "expands bid_match_type: #{key}" do
          get :test, params: { bid_match_type: key }

          expect(Attribution.last.bid_match_type).to eq value
        end
      end

      {
        'c' => 'computer',
        'm' => 'mobile',
        't' => 'tablet'
      }.each do |key, value|
        it "expands device_type: #{key}" do
          get :test, params: { device_type: key }

          expect(Attribution.last.device_type).to eq value
        end
      end

      {
        'b'   => 'broad',
        'c'   => 'content',
        'e'   => 'exact',
        'p'   => 'phrase',
        'std' => 'standard',
        'adv' => 'advanced',
        'cnt' => 'content'
      }.each do |key, value|
        it "expands match_type: #{key}" do
          get :test, params: { match_type: key }

          expect(Attribution.last.match_type).to eq value
        end
      end

      {
        'g' => 'google_search',
        's' => 'search_partner',
        'd' => 'display_network'
      }.each do |key, value|
        it "expands network: #{key}" do
          get :test, params: { network: key }

          expect(Attribution.last.network).to eq value
        end
      end

      {
        'fb'  => 'facebook',
        'ig'  => 'instagram',
        'msg' => 'messenger',
        'an'  => 'audience network'
      }.each do |key, value|
        it "expands source: #{key}" do
          get :test, params: { source: key }

          expect(Attribution.last.source).to eq value
        end
      end
    end
  end
end
