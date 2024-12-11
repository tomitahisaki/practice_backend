class CreateCountryDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :country_details do |t|
      t.string :area_code
      t.string :area_name
      t.string :country_code
      t.string :country_name
      t.integer :risk_level
      t.integer :infection_level
      t.text :visa_information
      t.text :stay_notice
      t.text :culture_and_health
      t.timestamps
    end
  end
end
