# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::HealthChecks', type: :request do
  describe 'GET /index' do
    subject { get api_v1_health_checks_path }

    it 'return a successful response' do
      subject
      expect(response).to have_http_status(200)
      expect(response.parsed_body['message']).to eq('API is running')
    end
  end
end
