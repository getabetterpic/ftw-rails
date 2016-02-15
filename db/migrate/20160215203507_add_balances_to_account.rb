class AddBalancesToAccount < ActiveRecord::Migration
  def change
    change_table :accounts do |t|
      t.column :available_balance, :decimal, precision: 14, scale: 4
      t.column :current_balance, :decimal, precision: 14, scale: 4
    end
  end
end
