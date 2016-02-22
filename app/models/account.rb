class Account < ActiveRecord::Base
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
end
