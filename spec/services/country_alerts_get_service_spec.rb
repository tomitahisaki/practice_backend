# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CountryAlertsGetService do
  describe '#execute' do
    subject { described_class.new(area_code:).execute }
    let!(:country_detail) { create(:country_detail, area_code: '10') }

    context 'when area_code exists' do
      let(:area_code) { '10' }

      let(:expected_country_alerts_params) do
        [
          {
            area_code: country_detail.area_code,
            area_name: country_detail.area_name,
            country_code: country_detail.country_code,
            country_name: country_detail.country_name,
            risk_level1: country_detail.risk_level1,
            risk_level2: country_detail.risk_level2,
            risk_level3: country_detail.risk_level3,
            risk_level4: country_detail.risk_level4,
            infection_level1: country_detail.infection_level1,
            infection_level2: country_detail.infection_level2,
            infection_level3: country_detail.infection_level3,
            infection_level4: country_detail.infection_level4
          }
        ]
      end

      it 'returns country_alerts_params' do
        expect(subject).to eq(expected_country_alerts_params)
      end
    end

    context 'when area_code does not exist' do
      let(:area_code) { '9999' }

      it 'returns empty array' do
        expect(subject).to eq([])
      end
    end
  end
end
