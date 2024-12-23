# frozen_string_literal: true

class CountryAlertsGetService
  def initialize(area_code:)
    @area_code = area_code

    @country_alerts_params = []
  end

  def execute
    country_details.map do |country_detail|
      @country_alerts_params << build_country_detail_params(country_detail)
    end

    @country_alerts_params
  end

  private

  attr_reader :area_code

  def build_country_detail_params(country_detail)
    {
      area_code: country_detail.area_code,
      area_name: country_detail.area_name,
      country_code: country_detail.country_code,
      country_name: country_detail.country_name,
      risk_level1: country_detail.risk_level1,
      risk_level2: country_detail.risk_level2,
      risk_level3: country_detail.risk_level3,
      risk_level4: country_detail.risk_level4,
      infection_level1: country_detail.infection_level1,
      infection_level2: country_detail.infection_level2,
      infection_level3: country_detail.infection_level3,
      infection_level4: country_detail.infection_level4
    }
  end

  def country_details
    @country_details ||= CountryDetail.by_area_code(area_code:)
  end
end
