require "rails_helper"

RSpec.describe BorrowerInstallment, type: :model do
  subject { build(:borrower_installment) }

  describe "validations" do
    it "valid" do
      expect(subject).to be_valid
    end

    it "invalid amount_in_cents" do
      subject.amount_in_cents = -1
      expect(subject).to be_invalid
    end

    it "invalid installment_number" do
      subject.installment_number = -1
      expect(subject).to be_invalid
    end
  end

  describe "methods" do
    context "amount_to_currency" do
      it "valid amount" do
        expect(subject.amount_to_currency()).to include("R$")
      end
      it "invalid amount" do
        subject.amount_in_cents = nil
        expect(subject.amount_to_currency()).to include(:error)
      end
    end
  end
end
