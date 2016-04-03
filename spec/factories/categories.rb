FactoryGirl.define do
  factory :category do
    name "Transportation Centers"
    type "place"
    parent parent_category
  end

  factory :parent_category do
    name "Travel"
    type "place"
    parent nil
  end
end
