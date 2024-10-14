class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings

  def date_formatted
    date.strftime("%m/%d/%Y")
  end

  def self.order_by_date
    self.order(date: :asc)
  end

  def flight_details
    "Leaving from: #{departure_airport.code}, \n
    Arriving at: #{arrival_airport.code}, \n
    Date: #{date_formatted}, \n
    Duration: #{duration_minutes} minutes"
  end
end
