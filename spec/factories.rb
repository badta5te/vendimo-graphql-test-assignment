FactoryBot.define do
  factory :property do
    property_type { "flat" }
    address { Faker::Address.full_address }
    size { rand(30.2...333.3).round(1) }
    bedrooms { rand(1...5) }
  end

  factory :furnishing do
    property
    name { Faker::House.furniture }
    color { Faker::Color.color_name }
    condition { "new" }
    quantity { rand(1...5) }
  end

  factory :valuation do
    property
    date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    value { rand(2000...3000) }
    currency { Faker::Currency.code }
    evaluator { Faker::Name.name }
  end
end
