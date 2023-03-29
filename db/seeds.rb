# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

TYPE_OF_PROPERTIES = ['flat', 'house', 'commercial real estate', 'condo'].freeze
CONDITIONS = %w[new used].freeze

3.times do
  property = Property.create(
    property_type: TYPE_OF_PROPERTIES.sample,
    address: Faker::Address.full_address,
    size: rand(30.2...333.3).round(1),
    bedrooms: rand(1...5)
  )

  Furnishing.create(
    property:,
    name: Faker::House.furniture,
    color: Faker::Color.color_name,
    condition: CONDITIONS.sample,
    quantity: rand(1...5),
  )

  Valuation.create(
    property:,
    date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    value: rand(2000...3000),
    currency: Faker::Currency.code,
    evaluator: Faker::Name.name
  )
end

3.times do
  Property.create(
    property_type: TYPE_OF_PROPERTIES.sample,
    address: Faker::Address.full_address,
    size: rand(30.2...333.3).round(1),
    bedrooms: rand(1...5)
  )
end
