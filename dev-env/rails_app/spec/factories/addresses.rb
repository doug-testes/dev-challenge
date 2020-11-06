FactoryBot.define do
  factory :address do
    street { "MyString" }
    number { "MyString" }
    postal_code { "MyString" }
    complement { "" }
    neighbourhood { "MyString" }
    city { "MyString" }
    state { "MyString" }
    company { nil }
  end
end
