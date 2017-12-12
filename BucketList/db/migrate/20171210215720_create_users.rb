class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :session_token
      # t.integer :user_id
      # t.integer :list_items

      t.timestamps
    end
    add_index :users, :username
    add_index :users, :session_token
  end
end
