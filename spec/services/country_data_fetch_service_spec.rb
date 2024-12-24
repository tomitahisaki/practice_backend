# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CountryDataFetchService do
  describe '#fetch_data' do
    let(:country_data_fetch_service) { described_class.new(country_code:) }
    let(:country_code) { '0010' }
    let(:xml) do
      Nokogiri::XML(<<-XML)
        <root>
          <area>
            <cd>1</cd>
            <name>Asia</name>
          </area>
          <country>
            <cd>0010</cd>
            <name>Japan</name>
          </country>
          <riskLevel1>1</riskLevel1>
          <riskLevel2>1</riskLevel2>
          <riskLevel3>0</riskLevel3>
          <riskLevel4>0</riskLevel4>
          <infectionLevel1>1</infectionLevel1>
          <infectionLevel2>0</infectionLevel2>
          <infectionLevel3>1</infectionLevel3>
          <infectionLevel4>0</infectionLevel4>
          <safetyMeasureMainText2>visa_information</safetyMeasureMainText2>
          <safetyMeasureMainText3>stay_notice</safetyMeasureMainText3>
          <safetyMeasureMainText4>culture_and_health</safetyMeasureMainText4>
        </root>
      XML
    end

    before do
      allow(URI).to receive(:parse).and_return(double(read: xml.to_s))
    end

    it 'returns country data' do
      expect(country_data_fetch_service.fetch_data).to eq(
        {
          area_code: '1',
          area_name: 'Asia',
          country_code: '0010',
          country_name: 'Japan',
          risk_level1: true,
          risk_level2: true,
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
      )
    end
  end
end
