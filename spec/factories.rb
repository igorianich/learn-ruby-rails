FactoryBot.define do
  factory :city do
    name { "Lviv" }
  end

  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    adress { "Doeddd" }
    age { 20 }
    city
  end

  factory :item do
    name { "John" }
    price  { 20 }
    association :owner, factory: :user
  end
end
