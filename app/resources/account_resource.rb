class AccountResource < JSONAPI::Resource
  attribute :description
  attribute :posted_balance
  has_many :transactions

  def self.records(options = {})
    context = options[:context]
    context[:current_user].accounts
  end
end
