class Company < ApplicationRecord
  has_one :address
  belongs_to :borrower_request

  accepts_nested_attributes_for :address

  validates :cnpj, cnpj_format: true
  validates :name, presence: true, allow_blank: false
  validates :phone, presence: true, allow_blank: false
end
