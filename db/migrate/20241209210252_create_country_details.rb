class CreateCountryDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :country_details do |t|
      t.string :area_code
      t.string :area_name
      t.string :country_code
      t.string :country_name
      t.boolean :risk_level1, default: false
      t.boolean :risk_level2, default: false
      t.boolean :risk_level3, default: false
      t.boolean :risk_level4, default: false
      t.boolean :infection_level1, default: false
      t.boolean :infection_level2, default: false
      t.boolean :infection_level3, default: false
      t.boolean :infection_level4, default: false
      t.text :visa_information
      t.text :stay_notice
      t.text :culture_and_health
      t.timestamps
    end
  end
end
