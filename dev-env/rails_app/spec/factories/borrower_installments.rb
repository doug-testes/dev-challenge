FactoryBot.define do
  factory :borrower_installment do
    status { 0 }
    borrower_request { build(:borrower_request) }
    amount_in_cents { rand(15000...18000) }
    due_date { DateTime.now + 1.month }
    installment_number { rand(1...12) }
  end
end
