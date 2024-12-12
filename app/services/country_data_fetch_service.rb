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
      risk_level:,
      infection_level:,
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

  def risk_level
    4.times do |i|
      return i + 1 if fetch_text(parse_xml, "riskLevel#{i + 1}") == 'Y'
    end
  end

  def infection_level
    4.times do |i|
      return i + 1 if fetch_text(parse_xml, "infectionLevel#{i + 1}") == 'Y'
    end
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
