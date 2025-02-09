# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(255)      not null
#  last_name  :string(255)      not null
#  email      :string(255)      not null#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  # バリデーション
  validates :first_name, presence: true, length: { maximum: 10 }
  validates :last_name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: true

  # インスタンス・メソッドやクラス・メソッドを定義する
  def full_name
    "#{first_name} #{last_name}"
  end
end
