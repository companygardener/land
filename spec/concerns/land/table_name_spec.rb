# frozen_string_literal: true

require 'rails_helper'

module Land
  describe TableName do
    it 'should generate the correct table name' do
      expect(Visit.table_name).to eq "#{Land.config.schema}.visits"
    end
  end
end
