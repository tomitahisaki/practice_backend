# frozen_string_literal: true

module Api
  module V1
    class CountryAlertsController < ApplicationController
      def index
        data = CountryAlertsGetService.new(area_code:).execute
        render json: data, status: :ok
      end

      def area_code
        params[:area_code]
      end
    end
  end
end
