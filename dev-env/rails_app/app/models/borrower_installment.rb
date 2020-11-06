class BorrowerInstallment < ApplicationRecord
  belongs_to :borrower_request

  enum status: { 'awaiting payment': 0, 'paid': 1, 'overdue': 2 }

  validates :amount_in_cents, :numericality => { :greater_than_or_equal_to => 0 }
  validates :installment_number, :numericality => { :greater_than_or_equal_to => 0 }

  def amount_to_currency
    return { error: "Invalid amount_in_cents" } unless self.amount_in_cents.is_a? Integer
    number_to_currency((self.amount_in_cents / 100), unit: "R$", separator: ",", delimiter: ".")
  end
end
