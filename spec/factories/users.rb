FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    current_lat { Faker::Address.latitude }
    current_long { Faker::Address.longitude }
    available { Faker::Boolean.boolean }
  end
end
