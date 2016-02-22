class Transaction < ActiveRecord::Base
  belongs_to :account, foreign_key: :plaid_account_id

  def self.create_plaid_transactions(person, plaid_transactions)
    return [] unless plaid_transactions.present?
    plaid_transactions.each do |transaction|
      Transaction.create(
        plaid_account_id: transaction.account,
        description: transaction.name,
        amount: transaction.amount,
        posted_date: transaction.date,
        plaid_id: transaction.id
      )
    end
  end
end
