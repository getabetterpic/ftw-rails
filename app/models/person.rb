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

  private

  def generate_authentication_token
    loop do
      token = SecureRandom.hex
      break token unless Person.where(authentication_token: token).first
    end
  end
end
