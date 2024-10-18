class PassengerMailer < ApplicationMailer
  default from: "hunyao123@gmail.com"
  layout "mailer"

  def confirmation_email
    Rails.logger.info("Params passenger: #{params[:passenger]}")
    @passenger = params[:passenger]
    @flight = params[:flight]
    mail(to: email_address_with_name(@passenger.email, @passenger.name),
    subject: "Dear #{@passenger.name}, your booking is confirmed.")
  end
end
