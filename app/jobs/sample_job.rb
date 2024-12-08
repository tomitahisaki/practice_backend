# frozen_string_literal: true

class SampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "I'm starting job"
    sleep 5
    puts "I'm finishing job"
  end
end
