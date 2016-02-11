class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :description
      t.decimal :amount, precision: 14, scale: 4
      t.date :authorized_date
      t.date :posted_date
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
