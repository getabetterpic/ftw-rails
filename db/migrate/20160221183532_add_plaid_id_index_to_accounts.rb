class AddPlaidIdIndexToAccounts < ActiveRecord::Migration
  def change
    add_index :accounts, :plaid_id
  end
end
