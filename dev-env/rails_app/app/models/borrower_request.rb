class BorrowerRequest < ApplicationRecord
  belongs_to :company

  enum :status { 'draft': 0, 'review': 1, 'approved': 2 }
end
