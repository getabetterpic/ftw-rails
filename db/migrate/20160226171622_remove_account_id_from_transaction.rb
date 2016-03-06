class RemoveAccountIdFromTransaction < ActiveRecord::Migration
  def change
    remove_column :transactions, :account_id
  end
end
