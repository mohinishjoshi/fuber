FactoryGirl.define do
  factory :booking do
    start_lat { Faker::Address.latitude }
    start_long { Faker::Address.longitude }
    dest_lat { Faker::Address.latitude }
    dest_long { Faker::Address.longitude }
    user
  end
end
