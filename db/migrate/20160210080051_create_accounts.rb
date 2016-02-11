class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :description
      t.decimal :posted_balance, precision: 14, scale: 4

      t.timestamps null: false
    end
  end
end
