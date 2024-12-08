# frozen_string_literal: true

class SampleJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Rails.logger.debug "I'm starting job"
    sleep 5
    Rails.logger.debug "I'm finishing job"
  end
end
