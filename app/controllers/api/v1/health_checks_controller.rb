# frozen_string_literal: true

module Api
  module V1
    class HealthChecksController < ApplicationController
      def index
        render json: { message: 'API is running' }, status: :ok
      end
    end
  end
end
