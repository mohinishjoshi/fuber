class User < ApplicationRecord
  has_many :bookings
  has_one :car
end
