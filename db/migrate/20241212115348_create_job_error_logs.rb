# frozen_string_literal: true

class CreateJobErrorLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :job_error_logs do |t|
      t.string :detail, null: false
      t.text :error_message, null: false
      t.string :error_class, null: false
      t.datetime :executed_at, null: false

      t.timestamps
    end
  end
end
