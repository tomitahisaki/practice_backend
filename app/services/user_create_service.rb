# frozen_string_literal: true

class UserCreateService
  def initialize(user_params)
    @user_params = user_params
  end

  def execute!
    user = User.new(@user_params)
    raise ActiveRecord::RecordInvalid, user if user.invalid?

    user.save!
  end
end
