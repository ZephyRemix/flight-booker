class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [ airport.code, airport.id ] }
    @flight_dates_options = Flight.order_by_date.all.map { |flight| [ flight.date_formatted, flight.date ] }
    if params[:flight].nil?
      render
    else
      # find for available flight that matches search
      @flights = Flight.where(departure_airport: flight_search_params[:departure_airport])
                        .where(arrival_airport: flight_search_params[:arrival_airport])
                        .where(date: flight_search_params[:date])
      @num_tickets = params[:num_tickets]
    end
  end

  private
  def flight_search_params
    params.require(:flight).permit(:departure_airport, :arrival_airport, :date)
  end
end
