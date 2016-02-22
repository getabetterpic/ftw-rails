class AddAccessTokenIndexToAccounts < ActiveRecord::Migration
  def change
    add_index :accounts, :plaid_access_token
  end
end
