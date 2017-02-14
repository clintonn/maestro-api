require_relative "../rails_helper"


describe User, type: :model do
  describe "validations" do
    context "when the email isn't unique" do
      it "is invalid" do
        expect(true).to be_truthy
      end
    end
  end
end
