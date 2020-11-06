FactoryBot.define do
  factory :company do
    cnpj { "08744817000186" }
    phone { "1138891800" }
    name { "DOCK SOLUCOES EM MEIOS DE PAGAMENTO S A" }
    borrower_request { build :borrower_request }

    trait :invalid_cnpj do
      cnpj { 123 }
    end

    trait :invalid_name do
      cnpj { "" }
    end

    trait :invalid_phone do
      cnpj { "" }
    end
  end
end
