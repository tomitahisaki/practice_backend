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

class CountryDetail < ApplicationRecord
  enum :area_code,
       { asia: '10', oceania: '20', north_america: '30', latin_america: '33', europe: '42', middle_east: '50',
         africa: '60' }
end
