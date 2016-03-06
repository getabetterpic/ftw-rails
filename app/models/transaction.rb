class Transaction < ActiveRecord::Base
  belongs_to :account, primary_key: :plaid_account_id

  def self.create_plaid_transactions(person, plaid_transactions)
    return [] unless plaid_transactions.present?
    plaid_transactions.each do |transaction|
      account = Account.where('plaid_id = ?', transaction.account).first
      next unless account
      data = {
        plaid_account_id: transaction.account,
        description: transaction.name,
        amount: transaction.amount,
        posted_date: transaction.date,
        plaid_id: transaction.id
      }
      tran = where('plaid_id = ?', transaction.id).first
      if tran
        tran.update(data)
        tran.save
      else
        Transaction.create(data)
      end
    end
  end
end
