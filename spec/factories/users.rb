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

FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "#{n}_first_name" }
    sequence(:last_name) { |n| "#{n}_last_name" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    age { '20' }
  end
end
