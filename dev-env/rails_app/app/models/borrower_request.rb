include ActionView::Helpers::NumberHelper

class BorrowerRequest < ApplicationRecord
  has_one :company
  has_many :borrower_installments

  enum status: { 'draft': 0, 'review': 1, 'approved': 2 }

  validates :loan_amount_in_cents, numericality: { greater_than_or_equal_to: 1500000, less_than_or_equal_to: 1800000000 }, presence: true
  validates :rate, :numericality => { :greater_than_or_equal_to => 0.00, :less_than_or_equal_to => 1.00 }
  validates :installments, :numericality => { :greater_than_or_equal_to => 0 }
  validates :installments_amount_in_cents, :numericality => { :greater_than_or_equal_to => 0 }
  validates :total_amount_payable_in_cents, :numericality => { :greater_than_or_equal_to => 0 }
  validate :dates_valid?

  def percentage_rate()
    self.rate * 100
  end

  def loan_amount_to_currency
    number_to_currency((self.loan_amount_in_cents / 100), unit: "R$", separator: ",", delimiter: ".")
  end

  def installments_amount_to_currency
    number_to_currency((self.installments_amount_in_cents / 100), unit: "R$", separator: ",", delimiter: ".")
  end

  def total_amount_payable_to_currency
    number_to_currency((self.total_amount_payable_in_cents / 100), unit: "R$", separator: ",", delimiter: ".")
  end

  private

  def dates_valid?
    return if [self.start_date.blank?, self.end_date.blank?].any?
    if start_date > end_date
      errors.add(:end_date, "Data invalida")
    end
  end
end
