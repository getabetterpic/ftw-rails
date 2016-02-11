class AccountResource < JSONAPI::Resource
  attribute :description
  attribute :posted_balance
  has_many :transactions
end
