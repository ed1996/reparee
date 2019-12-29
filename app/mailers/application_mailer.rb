class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def new_reservation(entreprise, reservation)
    @user = User.find(entreprise.user_id)
    @reservation = reservation
    @entreprise = entreprise
    mail(from: 'Reparee <no-reply@reparee.com>', to: @user.email, subject: "Nouvelle réservation !")
  end

end
