class PersonResource < JSONAPI::Resource
  attributes :email
  has_many :accounts
end
