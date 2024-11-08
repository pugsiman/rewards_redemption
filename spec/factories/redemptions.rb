FactoryBot.define do
  factory :redemption do
    user
    reward
    paid_amount { 100 }
  end
end
