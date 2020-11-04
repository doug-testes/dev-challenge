class Company < ApplicationRecord
  has_one :address
  has_many :borrower_requests
end
