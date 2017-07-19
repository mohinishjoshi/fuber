require 'rails_helper'

RSpec.describe Car, type: :model do
  context 'valid Factory' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:car)).to be_valid
    end
  end

  context "when a car is created" do
    let(:car) { FactoryGirl.build :car}

    it "is a new car object" do
      expect(car).to be_a_new(Car)
    end

    it "should be a valid car object" do
      expect(car).to be_valid
    end

    it "is expected to save car properly" do
      expect(car.user_id).not_to be_nil
    end
  end
end
