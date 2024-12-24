# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::CountryAlerts', type: :request do
  describe 'GET /api/v1/country_alerts/:area_code' do
    subject { get api_v1_country_alerts_path(area_code:) }

    let!(:country_detail) { create(:country_detail, area_code: '10') }

    context 'when area_code is valid' do
      let(:area_code) { '10' }

      let(:expected_response) do
        [
          {
            'area_code' => country_detail.area_code,
            'area_name' => country_detail.area_name,
            'country_code' => country_detail.country_code,
            'country_name' => country_detail.country_name,
            'risk_level1' => country_detail.risk_level1,
            'risk_level2' => country_detail.risk_level2,
            'risk_level3' => country_detail.risk_level3,
            'risk_level4' => country_detail.risk_level4,
            'infection_level1' => country_detail.infection_level1,
            'infection_level2' => country_detail.infection_level2,
            'infection_level3' => country_detail.infection_level3,
            'infection_level4' => country_detail.infection_level4
          }
        ]
      end

      it 'returns a 200 status code' do
        subject
        expect(response).to have_http_status(:ok)
        expect(response.parsed_body).to eq(expected_response)
      end
    end
  end
end
