# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CountryDetailGetJob, type: :job do
  describe '#perform' do
    subject { described_class.perform_now }

    let(:country_data_fetch_service) { instance_double(CountryDataFetchService) }
    let(:country_detail_instance) { instance_double(CountryDetail) }
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

    before do
      allow(CSV).to receive(:foreach).and_yield('country_code' => '0060')

      allow(CountryDataFetchService).to receive(:new).and_return(country_data_fetch_service)
      allow(country_data_fetch_service).to receive(:fetch_data).and_return(data)
      allow(CountryDetail).to receive(:find_or_initialize_by).and_return(country_detail_instance)
      allow(country_detail_instance).to receive(:update!).and_raise(ActiveRecord::RecordInvalid)
    end
    #  TODO: implement success case
    it 'raises error' do
      expect { subject }.to change { JobErrorLog.count }.by(1)
    end
  end
end
