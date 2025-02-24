# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      # POST /api/v1/users
      def create
        user_create_service = UserCreateService.new(user_params)
        user_create_service.execute!
        render json: { message: 'ユーザー登録しました' }, status: :ok
      rescue StandardError => e
        render json: { message: e.record.errors.full_messages }, status: :bad_request
      end

      private

      def user_params
        params.expect(user: %i[first_name last_name email age])
      end
    end
  end
end
