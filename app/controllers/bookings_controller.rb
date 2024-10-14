class BookingsController < ApplicationController
  def new
    selected_flight_id = params[:flight_id]
    passenger_num = params[:num_tickets]

    @booking = Booking.new
    @flight = Flight.find(selected_flight_id)
    passenger_num.to_i.times { @booking.passengers.build }
  end

  def create
    # Rails.logger.info("params sent in to Booking#create: #{params}")
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      Rails.logger.info("ERROR: #{@booking.errors.full_messages}")
      render "new"
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end


  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :name, :email ])
  end
end
