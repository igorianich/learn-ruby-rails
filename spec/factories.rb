FactoryBot.define do
  factory :option do
    value { 41 }
    filter
  end

  factory :category do
    name { "Boots" }
  end

  factory :filter do
    name { "Size" }
  end


  factory :city do
    name { 'Lviv' }
    population { 250_000 }
    country { 'Ukraine' }
  end

  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    adress { 'st. Zaporozhec' }
    age { 20 }
    city
  end

  factory :item do
    name { 'Gavnodavy' }
    price  { 24 }
    association :owner, factory: :user
    category
  end

  factory :booking do
    item { :item }
    association :borrower, factory: :user
    start_rent { Datetime.now }
    end_rent { Datetime.now.tomorow }
  end

  factory :review do
    association :reviewer, factory: :user
    for_item
    trait :for_item do
      association :reviewable, factory: :item
    end
    trait :for_user do
      association :reviewable, factory: :user
    end
    text { 'This is a good item' }
  end
end
