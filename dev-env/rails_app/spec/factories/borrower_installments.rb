FactoryBot.define do
  factory :borrower_installment do
    status { 1 }
    borrower_request { nil }
    value { 1 }
    due_date { "2020-11-04" }
    installment_number { 1 }
  end
end
