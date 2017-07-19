require 'rails_helper'
require 'byebug'



RSpec.describe BookingsController, type: :controller do
  describe "POST #create" do
    it "returns http success" do
      car = create_car
      post :create, {:source_location => "#{Faker::Address.latitude},#{Faker::Address.longitude}", :destination_location => "#{Faker::Address.latitude},#{Faker::Address.longitude}", :is_pink => "#{Faker::Boolean.boolean}"}
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it "returns a Returns a invalid response for taxi unavailability" do
      car = create_car
      car.user.update(is_available: false)
      post :create, {:source_location => "#{Faker::Address.latitude},#{Faker::Address.longitude}", :destination_location => "#{Faker::Address.latitude},#{Faker::Address.longitude}", :is_pink => "#{Faker::Boolean.boolean}"}
      expect(controller).to set_flash[:error]
    end

    it "returns a Returns a valid response for successful taxi request" do
      car = create_car
      post :create, {:source_location => "#{Faker::Address.latitude},#{Faker::Address.longitude}", :destination_location => "#{Faker::Address.latitude},#{Faker::Address.longitude}", :is_pink => "#{Faker::Boolean.boolean}"}
      response.should redirect_to(bookings_current_path(booking[:id]))
    end
  end
end
