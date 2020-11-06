class BorrowerInstallment < ApplicationRecord
  belongs_to :borrower_request

  enum status: { 'awaiting payment': 0, 'paid': 1, 'overdue': 2 }

  def amount_to_currency
    number_to_currency((self.amount_in_cents / 100), unit: "R$", separator: ",", delimiter: ".")
  end
end
