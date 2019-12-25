class ReservationsController < ApplicationController

  before_action :authenticate_user!

  def create
    @reservation = current_user.reservations.create(reservation_params)
    redirect_to @reservation.entreprise, notice: "Votre réservation a été acceptée"
  end

  def your_rdv
    @rdv = current_user.reservations
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :hour, :minute, :description, :address, :phone, :postal_code, :entreprise_id)
  end

end
