class AccountResource < JSONAPI::Resource
  attribute :description
  attribute :current_balance
  attribute :available_balance
  has_many :transactions

  def self.records(options = {})
    context = options[:context]
    context[:current_user].accounts
  end
end
