# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(255)      not null
#  last_name  :string(255)      not null
#  email      :string(255)      not null
#  age        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  # バリデーション
  validates :first_name, presence: true, length: { maximum: 10 }

  # インスタンス・メソッドやクラス・メソッドを定義する
end
