class AddPlaidIdToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :plaid_id, :string, index: true
  end
end
