class AddPlaidIdToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :plaid_id, :string
  end
end
