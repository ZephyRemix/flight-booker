class Passenger < ApplicationRecord
  has_many :bookings
  has_many :flights, through: :bookings, inverse_of: :passengers
end
