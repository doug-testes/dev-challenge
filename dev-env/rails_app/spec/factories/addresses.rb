FactoryBot.define do
  factory :address do
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    postal_code { Faker::Address.postcode }
    complement { Faker::Address.secondary_address }
    neighbourhood { "MyString" }
    city { Faker::Address.city }
    state { Faker::Address.state }
    company { build(:company) }
  end
end
