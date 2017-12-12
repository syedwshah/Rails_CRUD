class AddUserIdToListItems < ActiveRecord::Migration[5.1]
  def change
    add_column :list_items, :user_id, :integer
  end
end
