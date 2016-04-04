FactoryGirl.define do
  sequence :plaid_child do |n|
    OpenStruct.new(
      id: "2201800#{n}",
      type: "place",
      hierarchy: [
        "Travel",
        "Transportation Centers"
      ]
    )
  end

  sequence :plaid_parent do |n|
    OpenStruct.new(
      id: "2200000#{n}",
      type: "place",
      hierarchy: [
        "Travel"
      ]
    )
  end
end
