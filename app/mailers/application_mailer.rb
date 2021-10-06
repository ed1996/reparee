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

  def delete_reservation(entreprise, reservation)
    @user = User.find(entreprise.user_id)
    @reservation = reservation
    @entreprise = entreprise
    mail(from: 'Reparee <no-reply@reparee.com>', to: @user.email, subject: "Réservation annulée !")
  end

  def delete_rendezvous(entreprise, reservation)
    @user = User.find(reservation.user_id)
    @reservation = reservation
    @entreprise = entreprise
    mail(from: 'Reparee <no-reply@reparee.com>', to: @user.email, subject: "Rendez-vous annulée !")
  end

end
