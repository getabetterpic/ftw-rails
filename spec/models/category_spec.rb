require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:plaid_child) { FactoryGirl.generate(:plaid_child) }
  let(:plaid_parent) { FactoryGirl.generate(:plaid_parent) }

  it "creates a category from hash" do
    result = Category.add_plaid_category(plaid_child)
    expect(result).to be_a(Category)
  end

  it "creates the parent category" do
    result = Category.add_plaid_category(plaid_child)
    expect(result.parent).to_not be_nil
    expect(result.parent).to be_a(Category)
  end

  it "creates the category without a parent if top level category" do
    result = Category.add_plaid_category(plaid_parent)
    expect(result.path.split('.').count).to eq(1)
    expect(result.parent).to be_nil
  end
end
