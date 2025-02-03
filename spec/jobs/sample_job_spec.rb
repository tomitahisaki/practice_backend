# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SampleJob, type: :job do
  describe '#perform' do
    it 'prints Hello World to stdout' do
      expect { described_class.perform_now }.to output("Hello World\n").to_stdout
    end
  end
end
