class ReservationsController < ApplicationController

  before_action :authenticate_user!

  def create
    @reservation = current_user.reservations.create(reservation_params)
    if @reservation.save
      ApplicationMailer.new_reservation(Entreprise.find(@reservation.entreprise_id), @reservation).deliver_now
      redirect_to success_path
    end
  end

  def your_rdv
    @rdv = current_user.reservations
  end

  def your_reservations
    @entreprises = current_user.entreprises
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :hour, :minute, :description, :address, :phone, :postal_code, :entreprise_id)
  end

end
