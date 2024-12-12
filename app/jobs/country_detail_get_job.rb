# frozen_string_literal: true

class CountryDetailGetJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    csv_file_path = Rails.root.join('tmp/csv/country_code.csv')

    CSV.foreach(csv_file_path, headers: true) do |row|
      process_csv(row)
    end
  end

  private

  def process_csv(row)
    country_code = row['country_code']
    data = CountryDataFetchService.new(country_code:).fetch_data

    ApplicationRecord.transaction do
      country_detail = CountryDetail.find_or_initialize_by(country_code:)
      country_detail.update!(data)
    end
  rescue => e
    create_error_log(country_code, e.message, e.class)
  end

  def create_error_log(detail, error_message, error_class)
    JobErrorLog.create!(detail:, error_message:, error_class:, executed_at: Time.zone.now)
  end
end
