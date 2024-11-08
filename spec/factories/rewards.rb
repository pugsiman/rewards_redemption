FactoryBot.define do
  factory :reward do
    name { 'some reward' }
    cost { 100 }
    available { true }
    inventory_amount { 3 }
  end
end
