require "rails_helper"

RSpec.describe Company, type: :model do
  subject { build(:company) }

  describe "validations" do
    it "valid company" do
      expect(subject).to be_valid
    end

    it "invalid cnpj" do
      expect(build(:company, :invalid_cnpj)).to be_invalid
    end

    it "invalid name" do
      expect(build(:company, :invalid_name)).to be_invalid
    end

    it "invalid phone" do
      expect(build(:company, :invalid_phone)).to be_invalid
    end
  end
end
