require "rails_helper"

RSpec.describe BorrowerRequest, type: :model do
  describe "validations" do
    subject { build(:borrower_request) }
    let(:loan_value_low) { build(:borrower_request, :loan_value_low) }
    let(:loan_value_high) { build(:borrower_request, :loan_value_high) }

    it "when the loan amount is less" do
      loan_value_low.validate()
      expect(loan_value_low.errors[:loan_amount_in_cents]).to_not be_nil
    end

    it "when the loan value is high" do
      loan_value_high.validate()
      expect(loan_value_high.errors[:loan_amount_in_cents]).to_not be_nil
    end

    it "when the loan value is valid" do
      expect(subject.valid?).to be_truthy
    end

    it "when rate is invalid" do
      expect(build(:borrower_request, :invalid_rate)).to be_invalid
    end

    it "when installments is invalid" do
      expect(build(:borrower_request, :invalid_installments)).to be_invalid
    end

    it "when installments_amount_in_cents is invalid" do
      expect(build(:borrower_request, :invalid_installments_amount_in_cents)).to be_invalid
    end

    it "when total_amount_payable_in_cents is invalid" do
      expect(build(:borrower_request, :invalid_total_amount_payable_in_cents)).to be_invalid
    end

    it "when start_date or end_dateis invalid" do
      expect(build(:borrower_request, :invalid_dates)).to be_invalid
    end
  end
end
