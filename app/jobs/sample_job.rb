# frozen_string_literal: true

class SampleJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    country_code = '0060'
    data = CountryDataFetchService.new(country_code:).fetch_data
    country_detail = CountryDetail.find_or_initialize_by(country_code: country_code)
    country_detail.update!(data)
  end
end
