# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# iata_codes = [
#   "ATL", "PEK", "LAX", "DXB", "HND",
#   "ORD", "LHR", "CDG", "AMS", "FRA",
#   "SYD", "JFK", "SIN", "YYZ", "MEX",
#   "ICN", "GRU", "BKK", "MUC", "HKG"
# ]

# iata_codes.each do |c|
#   Airport.create(code: c)
# end

# 50.times do
#   airport_id = Airport.pluck(:id)

#   d_id = airport_id.sample
#   a_id = airport_id.sample
#   while d_id == a_id
#     a_id = airport_id.sample
#   end

#   Flight.create(
#     departure_airport_id: d_id,
#     arrival_airport_id: a_id,
#     date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
#     duration_minutes: Faker::Number.within(range: 30..100)
#   )
# end
