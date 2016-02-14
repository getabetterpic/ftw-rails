require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) { FactoryGirl.build(:person) }

  it 'downcases email on save' do
    email = 'UpperCase@email.com'
    person.email = email
    person.save!
    expect(person.email).to eq(email.downcase)
  end
end
