class BookingsController < ApplicationController
  def new
    selected_flight_id = params[:flight_id]
    passenger_num = params[:num_tickets]

    @booking = Booking.new
    @flight = Flight.find(selected_flight_id)
    passenger_num.to_i.times { @flight.passengers.build }

    # Rails.logger.info("params sent in to Booking#new: #{params}")
    # Rails.logger.info("Retrieving flight object from params: #{Flight.find(params[:flight_id])}")
    # Rails.logger.info("Retrieving flight object's details, e.g. chosen date: #{Flight.find(params[:flight_id]).date}")
  end

  def create
    @booking = Booking.new(params[:booking])
    if @booking.save
      flash[:success] = "Object successfully created"
      redirect_to @booking
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end
end
