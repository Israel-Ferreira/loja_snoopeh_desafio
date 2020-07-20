class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.string :card_number, null: false
      t.string :card_holder_name, null: false
      t.string :exp_date, null: false
      t.string :cvv, null: false
      t.references :txn, null: false, foreign_key: true

      t.timestamps
    end
  end
end
