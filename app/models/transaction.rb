class Transaction < ActiveRecord::Base
  has_many :transaction_categories
  has_many :categories, through: :transaction_categories
  belongs_to :account, primary_key: :plaid_account_id

  def self.create_plaid_transactions(plaid_transactions)
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
        tran = Transaction.create(data)
      end

      if transaction.cat.hierarchy && transaction.cat.hierarchy.length > 0
        transaction.cat.hierarchy.each do |category|
          c = Category.find_by(name: category)
          t_cat = TransactionCategory.find_by(category: c, transaction_id: tran.id)
          tran.categories << c if t_cat.nil? && !tran.categories.collect(&:name).include?(category)
        end
        tran.save
      end
    end
  end
end
