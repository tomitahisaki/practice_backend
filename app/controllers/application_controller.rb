# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authorized?

  def authorized?
    if request.headers['Authorization'] != 'Bearer 12346'
      render json: { message: 'Unauthorized' }, status: :unauthorized
    end
  end
end
