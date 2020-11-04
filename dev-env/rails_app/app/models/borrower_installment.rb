class BorrowerInstallment < ApplicationRecord
  belongs_to :borrower_request

  enum :status { 'awaiting payment': 0, 'paid': 1, 'overdue': 2 }
end
