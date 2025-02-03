# frozen_string_literal: true

class SampleJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    puts 'Hello World'
  end
end
