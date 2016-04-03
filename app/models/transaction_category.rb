class TransactionCategory < ActiveRecord::Base
  belongs_to :plaid_transaction, class_name: 'Transaction', foreign_key: :transaction_id
  belongs_to :category
end
