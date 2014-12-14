class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :total_items
      t.integer :lost_and_found_id

      t.timestamps
    end
  end
end
