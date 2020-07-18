class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.integer :price, null: false
      t.string :cep
      t.string :thumbnail_hd
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
