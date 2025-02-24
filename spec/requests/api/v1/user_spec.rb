# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'POST /api/v1/users' do
    subject { post api_v1_users_path, params: user_params }

    let(:user_params) do
      {
        user: {
          first_name:,
          last_name:,
          email:,
          age:
        }
      }
    end

    let(:first_name) { 'first_name' }
    let(:last_name) { 'last_name' }
    let(:email) { 'sample@example.com' }
    let(:age) { 20 }

    context '正常なデータが送られた時' do
      it 'status200を返し、登録できたメッセージを返す' do
        subject
        expect(response).to have_http_status(200)
        expect(response.parsed_body['message']).to eq('ユーザー登録しました')
      end
    end

    context 'emailの不備がある時' do
      let(:email) { 'sample-example.com' }

      it 'status400を返し、登録に失敗したメッセージを返す' do
        subject
        expect(response).to have_http_status(400)
        expect(response.parsed_body['message']).to eq('Emailは不正な値です')
      end
    end
  end
end
