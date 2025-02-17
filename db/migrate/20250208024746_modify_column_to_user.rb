class ModifyColumnToUser < ActiveRecord::Migration[8.0]
  def up
    change_column :users, :age, :integer
    add_index :users, :email, unique: true
  end

  def down
    change_column :users, :age, :string
    remove_index :users, :email
  end
end
