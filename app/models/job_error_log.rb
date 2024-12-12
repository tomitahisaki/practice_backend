# frozen_string_literal: true

# == Schema Information
#
# Table name: job_error_logs
#
#  id            :integer          not null, primary key
#  detail        :string(255)      not null
#  error_message :text(65535)      not null
#  error_class   :string(255)      not null
#  executed_at   :datetime         not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class JobErrorLog < ApplicationRecord
end
