class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def new_reservation(entreprise, reservation)
    @user = User.find(entreprise.user_id)
    @reservation = reservation
    @entreprise = entreprise
    mail(from: 'Reparee <no-reply@reparee.com>', to: @user.email, subject: "Nouvelle réservation !")
  end

  def new_rendezvous(entreprise, reservation)
    @user = User.find(reservation.user_id)
    @reservation = reservation
    @entreprise = entreprise
    mail(from: 'Reparee <no-reply@reparee.com>', to: @user.email, subject: "Nouveau rendez-vous !")
  end

end
