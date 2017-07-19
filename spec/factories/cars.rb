FactoryGirl.define do
  factory :car do
    is_available { Faker::Boolean.boolean }
    is_pink { Faker::Boolean.boolean }
    user
  end
end
