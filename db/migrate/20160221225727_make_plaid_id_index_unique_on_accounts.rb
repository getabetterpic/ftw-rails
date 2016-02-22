class MakePlaidIdIndexUniqueOnAccounts < ActiveRecord::Migration
  def change
    remove_index :accounts, :plaid_id
    add_index :accounts, :plaid_id, unique: true
  end
end
