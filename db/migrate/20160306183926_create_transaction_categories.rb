class CreateTransactionCategories < ActiveRecord::Migration
  def change
    create_table :transaction_categories do |t|
      t.references :transaction, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
