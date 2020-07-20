class CreateTxns < ActiveRecord::Migration[6.0]
  def change
    create_table :txns do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
