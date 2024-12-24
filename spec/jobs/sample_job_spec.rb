# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SampleJob, type: :job do
  describe '#perform' do
    let(:country_code) { '0060' }
    let(:data) do
      {
        area_code: '10',
        area_name: 'asia',
        country_code: '0060',
        country_name: 'Korea',
        risk_level1: true,
        risk_level2: false,
        risk_level3: false,
        risk_level4: false,
        infection_level1: true,
        infection_level2: false,
        infection_level3: true,
        infection_level4: false,
        visa_information: 'visa_information',
        stay_notice: 'stay_notice',
        culture_and_health: 'culture_and_health'
      }
    end
    let(:country_detail_instance) { CountryDetail.new }
    let(:country_data_fetch_service) { instance_double(CountryDataFetchService) }

    before do
      allow(CountryDataFetchService)
        .to receive(:new).with(country_code: country_code).and_return(country_data_fetch_service)
      allow(country_data_fetch_service).to receive(:fetch_data).and_return(data)
      allow(CountryDetail).to receive(:find_or_initialize_by).and_return(country_detail_instance)
    end

    subject { described_class.perform_now }

    let(:country_detail) { CountryDetail.last }
    let(:expected_data) do
      {
        area_code: 'asia',
        area_name: 'asia',
        country_code: '0060',
        country_name: 'Korea',
        risk_level1: true,
        risk_level2: false,
        risk_level3: false,
        risk_level4: false,
        infection_level1: true,
        infection_level2: false,
        infection_level3: true,
        infection_level4: false,
        visa_information: 'visa_information',
        stay_notice: 'stay_notice',
        culture_and_health: 'culture_and_health'
      }
    end

    it 'creates or updates country detail' do
      expect { subject }.to change { CountryDetail.count }.by(1)
      expect(country_detail).to have_attributes(expected_data)
    end
  end
end
