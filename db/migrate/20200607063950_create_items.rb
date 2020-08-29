class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :image_id
      t.string :name
      t.text :description
      t.integer :price_excluding_tax
      t.boolean :is_working, default: true

      t.timestamps
    end
  end
end
