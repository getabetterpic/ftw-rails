class AccountResource < JSONAPI::Resource
  attribute :description
  attribute :current_balance
  attribute :available_balance
  attribute :how_much_left
  has_many :transactions

  def self.records(options = {})
    context = options[:context]
    context[:current_user].accounts
  end

  def how_much_left
    123.45
  end
end
