FactoryBot.define do
  factory :borrower_request do
    status { 0 }
    loan_amount_in_cents { rand(1500000...1800000000) }
    rate { rand(0.00...1.00) }
    installments { 12 }

    trait :loan_value_low do
      loan_amount_in_cents { 1499999 }
    end

    trait :loan_value_high do
      loan_amount_in_cents { 1800000001 }
    end
    trait :review do
      status { "review" }
    end
    trait :approved do
      status { "approved" }
    end

    trait :invalid_rate do
      rate { -1.0 }
    end
    trait :invalid_installments do
      installments { rand(-1...-100) }
    end

    trait :invalid_installments_amount_in_cents do
      installments_amount_in_cents { rand(-1...-100) }
    end
    trait :invalid_total_amount_payable_in_cents do
      total_amount_payable_in_cents { rand(-1...-100) }
    end

    trait :invalid_dates do
      start_date { DateTime.now }
      end_date { DateTime.now - 2.month }
    end
  end
end
