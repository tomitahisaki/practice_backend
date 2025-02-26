class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, comment: 'ユーザーテーブル' do |t|
      t.string :first_name, null: false, comment: '名前'
      t.string :last_name, null: false, comment: '苗字'
      t.string :email, null: false, comment: 'メールアドレス'
      t.string :age, comment: '年齢'

      t.timestamps
    end
  end
end
