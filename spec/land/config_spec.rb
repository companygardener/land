# frozen_string_literal: true

require 'rails_helper'

describe Land::Config do
  describe '#blank_user_agent_string' do
    it 'has a default' do
      expect(subject.blank_user_agent_string).to eq 'user agent missing'
    end

    it 'remembers the value' do
      subject.blank_user_agent_string = 'something else'
      expect(subject.blank_user_agent_string).to eq 'something else'
    end
  end

  describe '#enabled' do
    it 'allows true and false' do
      [true, false].each do |value|
        expect { subject.enabled = value }.to_not raise_error
        expect(subject.enabled).to eq value
      end
    end

    it 'rejects invalid values' do
      [0, :invalid, ""].each do |value|
        expect { subject.enabled = value }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#schema' do
    it 'has a default' do
      expect(subject.schema).to eq 'land'
    end

    it 'remembers the value' do
      subject.schema = 'different'
      expect(subject.schema).to eq 'different'
    end
  end

  describe '#secure_cookie' do
    it 'allows true and false' do
      [true, false].each do |value|
        expect { subject.secure_cookie = value }.to_not raise_error
        expect(subject.secure_cookie).to eq value
      end
    end

    it 'rejects invalid values' do
      [0, :invalid, ""].each do |value|
        expect { subject.secure_cookie = value }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#untracked_ips' do
    it 'defaults to an empty list' do
      expect(subject.untracked_ips).to be_empty
    end
  end

  describe '#add_untracked_ip' do
    it 'modifies untracked_ips' do
      expect { subject.add_untracked_ip('127.0.0.1') }.to change { subject.untracked_ips }
    end
  end

  describe '#untracked_paths' do
    it 'defaults to an empty list' do
      expect(subject.untracked_paths).to be_empty
    end
  end

  describe '#add_untracked_path' do
    it 'modifies untracked_paths' do
      expect { subject.add_untracked_path('/ping') }.to change { subject.untracked_paths }
    end
  end

  describe '#visit_timeout' do
    it 'has a default' do
      expect(subject.visit_timeout).to eq 30.minutes
    end

    it 'remembers the value' do
      subject.visit_timeout = 15.minutes
      expect(subject.visit_timeout).to eq 15.minutes
    end

    it 'rejects negative values' do
      expect { subject.visit_timeout = -5.minutes }.to raise_error(ArgumentError)
    end

    it 'rejects invalid values' do
      ['5 minutes'].each do |value|
        expect { subject.visit_timeout = value }.to raise_error (ArgumentError)
      end
    end
  end
end
