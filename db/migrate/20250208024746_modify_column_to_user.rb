class ModifyColumnToUser < ActiveRecord::Migration[8.0]
  def change
    change_column :users, :age, :integer

    add_index :users, :email, unique: true
  end
end
