class CreateCompleteds < ActiveRecord::Migration[5.1]
  def change
    create_table :completeds do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
