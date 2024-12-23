# == Schema Information
#
# Table name: country_details
#
#  id                 :integer          not null, primary key
#  area_code          :string(255)
#  area_name          :string(255)
#  country_code       :string(255)
#  country_name       :string(255)
#  risk_level1        :boolean
#  risk_level2        :boolean
#  risk_level3        :boolean
#  risk_level4        :boolean
#  infection_level1   :boolean
#  infection_level2   :boolean
#  infection_level3   :boolean
#  infection_level4   :boolean
#  visa_information   :text(65535)
#  stay_notice        :text(65535)
#  culture_and_health :text(65535)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

# frozen_string_literal: true

# spec/factories/country_details.rb
FactoryBot.define do
  factory :country_detail do
    area_code { CountryDetail.area_codes.keys.sample } 
    area_name { Faker::Address.community }
    country_code { Faker::Number.number(digits: 4) }
    country_name { Faker::Address.country }
    risk_level1 { Faker::Boolean.boolean }
    risk_level2 { Faker::Boolean.boolean }
    risk_level3 { Faker::Boolean.boolean }
    risk_level4 { Faker::Boolean.boolean }
    infection_level1 { Faker::Boolean.boolean }
    infection_level2 { Faker::Boolean.boolean }
    infection_level3 { Faker::Boolean.boolean }
    infection_level4 { Faker::Boolean.boolean }
    visa_information { Faker::Lorem.paragraph }
    stay_notice { Faker::Lorem.paragraph }
    culture_and_health { Faker::Lorem.paragraph }
  end
end

