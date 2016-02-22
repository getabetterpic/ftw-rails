class AddAdditionalFieldsToAccount < ActiveRecord::Migration
  def change
    change_table :accounts do |t|
      t.column :username, :string, index: true
      t.column :bank_code, :string
      t.column :plaid_access_token, :string
    end
  end
end
