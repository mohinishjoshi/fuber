require 'rails_helper'

RSpec.describe User, type: :model do
  context 'valid Factory' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:user)).to be_valid
    end
  end

  first_name = Faker::Name.name
  last_name = Faker::Name.name

  user = User.new
  user.first_name = first_name
  user.last_name = last_name
  user.save!(validations: false)
  new_user = User.new

  context 'When a new User is initialized' do
    it 'is a new user initialized' do
      expect(new_user).to be_a_new(User)
    end
  end

  context 'When a User details are saved' do
    it 'is expected to save a user object' do
      expect(user).to be_a(User)
    end

    it 'should be a valid User object' do
      expect(user).to be_valid
    end
  end
  it 'is expected to save the required user properties as defined' do
    expect(user.first_name).to eq(first_name)
    expect(user.last_name).to eq(last_name)
  end
end
