class AddPlaidAccountIdIndexToTransactions < ActiveRecord::Migration
  def change
    add_index :transactions, :plaid_account_id
  end
end
