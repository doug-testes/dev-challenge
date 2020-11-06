class Address < ApplicationRecord
  belongs_to :company

  def resume_basic
    resume_with(%i[street number complement neighbourhood state])
  end

  def resume_with(attrs = %i[street number complement neighbourhood city state])
    attrs.map{|attr| self.send(attr)&.strip }.select(&:present?).join(', ')
  end

end
