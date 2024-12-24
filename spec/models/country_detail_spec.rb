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

require 'rails_helper'

RSpec.describe CountryDetail, type: :model do
  describe '.by_area_code' do
    subject { CountryDetail.by_area_code(area_code:) }

    let(:country_details) { create_list(:country_detail, 3, area_code: area_code) }

    context 'when area_code exist' do
      let(:area_code) { '10' }
      let(:country_details) { create_list(:country_detail, 3, area_code: area_code) }

      it 'returns country details' do
        expect(subject).to match_array(country_details)
      end
    end

    context 'when area_code does not exist' do
      let(:area_code) { '99' }

      it 'returns empty' do
        expect(subject).to be_empty
      end
    end
  end
end
