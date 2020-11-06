require "rails_helper"

RSpec.describe BorrowerService do
  let(:valid_borrower_request) { create(:borrower_request) }
  subject { BorrowerService.new() }
  let(:start_date) { DateTime.now + 1.month }
  context "instance" do
    it "success" do
      expect(BorrowerService.new()).to_not be_nil
    end
  end

  describe "methods" do
    context "calculate_installment_amount" do
      # invalid values
      # invalid taxe
      # invalid installments
      # Without arond

      it "success" do
        loan_amount = 10000000
        installment_amount_per_month = 916800
        rate = 0.015
        number_installments = 12
        expect(subject.calculate_loan( start_date ,loan_amount, rate, number_installments)[:result][:installment_amount_per_month]).to eq(installment_amount_per_month)
        #expect(subject.calculate_installment_amount( start_date ,10000000, 0.015, 12)).to eq(916800)
        #expect(subject.calculate_installment_amount(start_date, 10000000, 0.015, 12, false)).to eq(916799.9290622945)
      end
    end

    context "generate_review" do

      # Error
      it "success" do
        expect(subject.generate_review(valid_borrower_request)).to include(:result)
      end       
    end

    context "approve" do
      it "success" do
        valid_borrower_request_in_review = subject.generate_review(valid_borrower_request)[:result]
        expect(subject.approve(valid_borrower_request_in_review)).to include(:result)
        # Checar relacionamentos
      end
    end

  end
end
