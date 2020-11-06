# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Borrower Requests

borrower_request_1 = BorrowerRequest.create(
  loan_amount_in_cents: 10000000,
  installments: 12,
)

# Companies
company_1 = Company.find_or_create_by(
  name: "DOCK SOLUCOES EM MEIOS DE PAGAMENTO S A",
  phone: "1138891800",
  cnpj: "08744817000186",
  borrower_request: borrower_request_1
)

# Addresses

Address.create(
  street: "AV TAMBORE",
  number: "267",
  postal_code: "06.460-000",
  complement: "",
  neighbourhood: "TAMBORE",
  city: "BARUERI",
  state: "SP",
  company: company_1,
)


# Borrower Installments

BorrowerInstallment.create(
  borrower_request: borrower_request_1,
  amount_in_cents: 1,
  due_date: DateTime.now,
  installment_number: 1,
)
