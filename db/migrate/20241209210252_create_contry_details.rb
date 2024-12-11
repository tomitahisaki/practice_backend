class CreateContryDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :contry_details do |t|
      t.integer :area_code
      t.string :area_name
      t.integer :contry_code
      t.string :contry_name
      t.integer :risk_level
      t.integer :infection_level
      t.text :visa_information
      t.text :stay_notice
      t.text :culture_and_health
      t.timestamps
    end
  end
end
