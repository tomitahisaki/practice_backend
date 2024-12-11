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
      area_code: fetch_text(parse_xml, 'area cd'),
      area_name: fetch_text(parse_xml, 'area name'),
      country_code: fetch_text(parse_xml, 'country cd'),
      country_name: fetch_text(parse_xml, 'country name'),
      risk_level: risk_level,
      infection_level: infection_level,
      visa_information: fetch_text(parse_xml, 'safetyMeasureMainText2'),
      stay_notice: fetch_text(parse_xml, 'safetyMeasureMainText3'),
      culture_and_health: fetch_text(parse_xml, 'safetyMeasureMainText4')
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
end
