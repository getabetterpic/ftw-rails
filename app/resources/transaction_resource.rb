class TransactionResource < JSONAPI::Resource
  attribute :description
  attribute :amount
  attribute :authorized_date
  attribute :posted_date
  has_one :account, foreign_key: 'account_id'

  def self.record(options = {})
    context = options[:context]
    context[:current_user].transactions
  end
end
