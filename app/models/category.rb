  class Category < ActiveRecord::Base
  has_ltree_hierarchy
  has_many :transaction_categories
  has_many :plaid_transactions, through: :transaction_categories

  def self.inheritance_column
    "category_type"
  end

  def self.add_plaid_category(category)
    length = category.hierarchy.length
    if length == 1
      create_top_level_category(category)
    else
      create_child_category(category)
    end
  end

  private

  def self.create_top_level_category(category)
    category_name = category.hierarchy[-1]
    new_category = Category.find_or_create_by(name: category_name, type: category.type)
    new_category.plaid_id = category.id
    new_category.save
    new_category
  end

  def self.create_child_category(category)
    parent_name = category.hierarchy[-2]
    category_name = category.hierarchy[-1]
    parent = Category.find_or_create_by(name: parent_name, type: category.type)
    child = Category.find_or_create_by(name: category_name, type: category.type, parent: parent)
    child.plaid_id = category.id
    child.type = category.type
    child.parent = parent
    child.save
    child
  end
end
