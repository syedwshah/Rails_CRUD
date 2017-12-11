class CreateListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :list_items do |t|
      t.string :name
      t.string :priority
      t.string :description
      t.string :achieved
      t.belongs_to :user, index: true

      t.timestamps
    end
    add_index :list_items, :name
    add_index :list_items, :priority
    add_index :list_items, :description
    add_index :list_items, :achieved
  end
end
