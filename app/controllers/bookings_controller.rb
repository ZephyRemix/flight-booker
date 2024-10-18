class BookingsController < ApplicationController
  before_action :send_confirmation_email, only: [ :show ]
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
      # Rails.logger.info("ERROR: #{@booking.errors.full_messages}")
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

  def send_confirmation_email
    Rails.logger.info("Parmas within the context of send_confirmation_email are: #{params}")
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @booking.passengers.each { |passenger| PassengerMailer.with(passenger: passenger, flight: @flight).confirmation_email.deliver_later }
  end
end
