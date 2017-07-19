class Booking < ApplicationRecord
  belongs_to :user

  validates_presence_of :start_lat
  validates_presence_of :start_long
  validates_presence_of :dest_lat
  validates_presence_of :dest_long
end
