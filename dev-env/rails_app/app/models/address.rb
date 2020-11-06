class Address < ApplicationRecord
  belongs_to :company

  validates :street, presence: true, allow_blank: false
  validates :postal_code, presence: true, allow_blank: false
  validates :city, presence: true, allow_blank: false
  validates :state, presence: true, allow_blank: false

  def resume_basic
    resume_with(%i[street number complement neighbourhood state])
  end

  def resume_with(attrs = %i[street number complement neighbourhood city state])
    attrs.map { |attr| self.send(attr)&.strip }.select(&:present?).join(", ")
  end
end
