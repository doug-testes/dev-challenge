# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Companies
company_1 = Company.find_or_create_by(
  name: "DOCK SOLUCOES EM MEIOS DE PAGAMENTO S A",
  phone: "1138891800",
  cnpj: "08744817000186",
)

# Addresses

Address.create(
  street: "AV TAMBORE",
  number: "267",
  postal_code: "06.460-000",
  complement: "",
  neighbourdhood: "TAMBORE",
  city: "BARUERI",
  state: "SP",
  company: company_1,
)

# Borrower Requests

borrower_request_1 = BorrowerRequest.create(
  loan_value: 10000000,
  installments: 12,
  company: company_1,
)

# Borrower Installments

BorrowerInstallment.create(
  borrower_request: borrower_request_1,
  value: 1,
  due_date: DateTime.now,
  installment_number: 1,
)
