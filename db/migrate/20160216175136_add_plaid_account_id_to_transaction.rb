class AddPlaidAccountIdToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :plaid_account_id, :string
  end
end
