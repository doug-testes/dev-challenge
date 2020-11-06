FactoryBot.define do
  factory :borrower_request do
    status { 0 }
    loan_amount_in_cents { 10000000 }
    rate { "0.015" }
    installments { 12 }

    trait :loan_value_low do
      loan_value { 1499999 }
    end

    trait :loan_value_high do
      loan_value { 1800000001 }
    end
  end
end
