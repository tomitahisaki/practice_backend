# frozen_string_literal: true

class SampleJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    log_message('Starting the job')
    sleep 5
    log_message('Finishing the job')
  end

  private

  def log_message(message)
    $stdout.puts(message)
  end
end
