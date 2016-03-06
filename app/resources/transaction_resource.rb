class TransactionResource < JSONAPI::Resource
  attribute :description
  attribute :amount, format: :reverse_sign
  attribute :authorized_date
  attribute :posted_date
  has_one :account, foreign_key: 'account_id'

  def self.record(options = {})
    context = options[:context]
    context[:current_user].transactions
  end

  def self.apply_sort(records, order_options, context = {})
    records = records.order(posted_date: :desc)
    super(records, order_options, context)
  end
end
