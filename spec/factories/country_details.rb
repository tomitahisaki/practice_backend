# == Schema Information
#
# Table name: country_details
#
#  id                 :integer          not null, primary key
#  area_code          :string(255)
#  area_name          :string(255)
#  country_code       :string(255)
#  country_name       :string(255)
#  risk_level         :integer
#  infection_level    :integer
#  visa_information   :text(65535)
#  stay_notice        :text(65535)
#  culture_and_health :text(65535)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

# frozen_string_literal: true

FactoryBot.define do
  factory :contry_detail do
    area_code { 1 }
    area_name { 'MyString' }
    contry_code { 1 }
    contry_name { 'MyString' }
    risk_level { 1 }
    infection_level { 1 }
    visa_information { 'MyText' }
    stay_notie { 'MyText' }
    culture_and_health { 'MyText' }
  end
end
