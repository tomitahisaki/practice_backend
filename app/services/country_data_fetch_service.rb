# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

class CountryDataFetchService
  BASE_URL = 'https://www.ezairyu.mofa.go.jp/opendata/country'

  def initialize(country_code:)
    @country_code = country_code
  end

  def fetch_data
    {
      area_code:,
      area_name:,
      country_code:,
      country_name:,
      **fetch_levels_data,
      **fetch_infomation_data
    }
  end

  def fetch_levels_data
    {
      risk_level1:,
      risk_level2:,
      risk_level3:,
      risk_level4:,
      infection_level1:,
      infection_level2:,
      infection_level3:,
      infection_level4:
    }
  end

  def fetch_infomation_data
    {
      visa_information:,
      stay_notice:,
      culture_and_health:
    }
  end

  private

  def fetch_file
    url = "#{BASE_URL}/#{@country_code}A.xml"
    URI.parse(url).read
  end

  def parse_xml
    @parse_xml ||= Nokogiri::XML(fetch_file)
  end

  def fetch_text(docs, tag)
    node = docs.at(tag)
    node&.text
  end

  def area_code
    fetch_text(parse_xml, 'area cd')
  end

  def area_name
    fetch_text(parse_xml, 'area name')
  end

  def country_code
    fetch_text(parse_xml, 'country cd')
  end

  def country_name
    fetch_text(parse_xml, 'country name')
  end

  def risk_level1
    fetch_text(parse_xml, 'riskLevel1') == '1'
  end

  def risk_level2
    fetch_text(parse_xml, 'riskLevel2') == '1'
  end

  def risk_level3
    fetch_text(parse_xml, 'riskLevel3') == '1'
  end

  def risk_level4
    fetch_text(parse_xml, 'riskLevel4') == '1'
  end

  def infection_level1
    fetch_text(parse_xml, 'infectionLevel1') == '1'
  end

  def infection_level2
    fetch_text(parse_xml, 'infectionLevel2') == '1'
  end

  def infection_level3
    fetch_text(parse_xml, 'infectionLevel3') == '1'
  end

  def infection_level4
    fetch_text(parse_xml, 'infectionLevel4') == '1'
  end

  def visa_information
    fetch_text(parse_xml, 'safetyMeasureMainText2')
  end

  def stay_notice
    fetch_text(parse_xml, 'safetyMeasureMainText3')
  end

  def culture_and_health
    fetch_text(parse_xml, 'safetyMeasureMainText4')
  end
end
