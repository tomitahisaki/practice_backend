# frozen_string_literal: true

class Api::V1::HealthChecksController < ApplicationController
  def index
    render json: { message: 'API is running' }, status: :ok
  end
end
