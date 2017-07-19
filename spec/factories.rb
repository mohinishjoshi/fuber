module Factories
  def create_user
    params = {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      current_lat: Faker::Address.latitude,
      current_long: Faker::Address.longitude,
      available: Faker::Boolean.boolean
    }
    user = User.create(params)
    user
  end

  def create_car
    user = create_user
    params = {
      is_available: Faker::Boolean.boolean,
      is_pink: Faker::Boolean.boolean
    }
    car = Car.new(params)
    car.user = user
    car.save
    car
  end

  def create_booking
    car = create_car
    params = {
      start_lat: Faker::Address.latitude,
      start_long: Faker::Address.longitude,
      dest_lat: Faker::Address.latitude,
      dest_long: Faker::Address.longitude
    }
    booking = Booking.new(params)
    booking.user = car.user
    booking.save
    booking
  end

end
