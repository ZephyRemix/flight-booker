class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [ airport.code, airport.id ] }
    @flight_dates_options = Flight.all.map { |flight| [ flight.date.to_date, flight.date ] }
    if params[:flight].nil?
      render
    else
      Rails.logger.info("Params: #{params}")
      Rails.logger.info("Flight params: #{params[:flight]}")
      # find for available flight that matches search
      @flights = Flight.where(departure_airport: params[:flight][:departure_airport])
                        .where(arrival_airport: params[:flight][:arrival_airport])
                        .where(date: params[:flight][:date])
      Rails.logger.info(@flights)
    end
  end
end
