class AddUniqueIndexForAccountIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :plaid_id, :string
    add_index :transactions, :plaid_id, unique: true
  end
end
