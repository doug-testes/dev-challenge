require "rails_helper"

RSpec.describe Address, type: :model do
  subject { build(:address) }

  describe "validations" do
    it "valid address" do
      expect(subject).to be_valid
    end

    it "invalid street" do
      subject.street = ""
      expect(subject).to be_invalid
    end

    it "invalid postal_code" do
      subject.postal_code = ""
      expect(subject).to be_invalid
    end

    it "invalid city" do
      subject.city = ""
      expect(subject).to be_invalid
    end

    it "invalid state" do
      subject.state = ""
      expect(subject).to be_invalid
    end
  end
end
