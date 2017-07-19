# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'database_cleaner'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true


  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

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
