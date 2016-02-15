class Person < ActiveRecord::Base
  has_secure_password
  before_create :ensure_authentication_token
  validates :email, uniqueness: true, presence: true
  has_many :accounts
  before_validation :downcase_email

  def downcase_email
    self.email = email.downcase if email.present?
  end

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def self.authenticate(email, password)
    person = Person.find_by(email: email)
    unless person && person.authenticate(password)
      return "Email or password invalid"
    end
    person
  end

  def create_accounts(plaid_accounts, plaid_access_token)
    return [] unless plaid_accounts.present?
    plaid_accounts.each do |account|
      self.accounts.create(
        description: account.name,
        current_balance: account.current_balance,
        available_balance: account.available_balance,
        bank_code: account.institution_type,
        plaid_access_token: plaid_access_token
      )
    end
    return self.accounts
  end

  private

  def generate_authentication_token
    loop do
      token = SecureRandom.hex
      break token unless Person.where(authentication_token: token).first
    end
  end
end
