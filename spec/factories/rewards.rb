FactoryBot.define do
  factory :reward do
    sequence(:name) do |n|
      "name#{n}"
    end
    cost { 100 }
    available { true }
    inventory_amount { 3 }
  end
end
