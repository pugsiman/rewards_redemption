FactoryBot.define do
  factory :user do
    sequence :name do |n|
      "name#{n}"
    end
    sequence :email do |n|
      "email#{n}@domain.com"
    end
    credits_amount { 300 }
  end
end
