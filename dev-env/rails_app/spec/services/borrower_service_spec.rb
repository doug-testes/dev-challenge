require "rails_helper"

RSpec.describe BorrowerService do
  let(:valid_borrower_request) { create(:borrower_request) }
  let(:borrower_request_on_review) { create(:borrower_request, :review) }
  let(:borrower_request_on_approved) { create(:borrower_request, :approved) }
  subject { BorrowerService.new() }
  let(:start_date) { DateTime.now + 1.month }

  let(:user_case_params) { { start_date: start_date, loan_amount: 10000000, rate: 0.015, number_installments: 12, installment_amount_per_month: 916800 } }
  let(:random_params) { { start_date: start_date, loan_amount: rand(1500000...1800000000), rate: 0.015, number_installments: 12 } }

  context "instance" do
    it "success" do
      expect(BorrowerService.new()).to_not be_nil
    end
  end

  describe "methods" do
    context "calculate_installment_amount" do
      it "success with use case" do
        expect(
          subject.calculate_loan(
            user_case_params[:start_date],
            user_case_params[:loan_amount],
            user_case_params[:rate],
            user_case_params[:number_installments]
          )[:result][:installment_amount_per_month]
        ).to eq(user_case_params[:installment_amount_per_month])
      end

      it "success with random variables" do
        r = subject.calculate_loan(
          random_params[:start_date],
          random_params[:loan_amount],
          random_params[:rate],
          random_params[:number_installments]
        )

        expect(
          r[:result][:installment_amount_per_month]
        ).to eq(r[:result][:loan_amount_to_pay] / r[:result][:number_installments])
      end

      it "when invalid loan_amount" do
        expect(
          subject.calculate_loan(
            user_case_params[:start_date],
            -2,
            user_case_params[:rate],
            user_case_params[:number_installments]
          )
        ).to include(:error)
      end

      it "when invalid number_installments" do
        expect(
          subject.calculate_loan(
            user_case_params[:start_date],
            random_params[:loan_amount],
            user_case_params[:rate],
            0
          )
        ).to include(:error)
      end

      it "when invalid rate" do
        expect(
          subject.calculate_loan(
            user_case_params[:start_date],
            random_params[:loan_amount],
            0,
            user_case_params[:number_installments]
          )
        ).to include(:error)
      end

      it "when rescue" do
        expect(
          subject.calculate_loan(
            user_case_params[:start_date],
            random_params[:loan_amount],
            "error",
            user_case_params[:number_installments],
          )
        ).to include(:error)
      end
    end

    context "generate_review" do
      it "success" do
        expect(subject.generate_review(valid_borrower_request)).to include(:result)
      end

      it "when invalid borrower_request" do
        expect(subject.generate_review(borrower_request_on_review)).to include(:error)
        expect(subject.generate_review(borrower_request_on_approved)).to include(:error)
      end
    end

    context "approve" do
      it "success" do
        valid_borrower_request_in_review = subject.generate_review(valid_borrower_request)[:result]
        expect(subject.approve(valid_borrower_request_in_review)).to include(:result)
        expect(valid_borrower_request_in_review.borrower_installments.count()).to eq(12)
      end

      it "when invalid borrower_request" do
        expect(subject.approve(borrower_request_on_approved)).to include(:error)
      end
    end
  end
end
