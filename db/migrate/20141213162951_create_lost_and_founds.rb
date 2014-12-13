class CreateLostAndFounds < ActiveRecord::Migration
  def change
    create_table :lost_and_founds do |t|
      t.string :name
      t.integer :lost_articles
      t.integer :items_claimed

      t.timestamps
    end
  end
end
