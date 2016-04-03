class Account < ActiveRecord::Base
  # self.primary_key = 'plaid_id'
  has_many :transactions, foreign_key: :plaid_account_id, primary_key: :plaid_id, dependent: :destroy
  belongs_to :person

  def self.create_plaid_accounts(person, plaid_accounts, access_token)
    return [] unless plaid_accounts.present?
    plaid_accounts.each do |account|
      person.accounts.create(
        description: account.name,
        plaid_id: account.id,
        current_balance: account.current_balance,
        available_balance: account.available_balance,
        bank_code: account.institution_type,
        plaid_access_token: access_token
      )
    end
    return person.accounts
  end

  def self.update_account_balances(person, plaid_accounts)
    plaid_accounts.each do |account|
      acct = person.accounts.where('plaid_id = ?', account.id).first
      next unless acct
      acct.current_balance = account.current_balance
      acct.available_balance = account.available_balance
      acct.save
    end
  end

  def update_transactions
    plaid_user = Plaid.set_user(plaid_access_token, ['connect'])
    Transaction.create_plaid_transactions(person, plaid_user.transactions)
  end

  def get_plaid_connect_user
    Plaid.set_user(self.plaid_access_token, ['connect'])
  end
end
