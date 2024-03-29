class ReservationsController < ApplicationController

  before_action :authenticate_user!

  def create
    @reservation = current_user.reservations.create(reservation_params)
    if @reservation.save
      ApplicationMailer.new_reservation(Entreprise.find(@reservation.entreprise_id), @reservation).deliver_now
      ApplicationMailer.new_rendezvous(Entreprise.find(@reservation.entreprise_id), @reservation).deliver_now
      redirect_to success_path
    end
  end

  def your_rdv
    @rdv = current_user.reservations.order("created_at DESC").limit(5)
  end

  def your_reservations
    @entreprises = current_user.entreprises.order("created_at DESC").limit(5)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      ApplicationMailer.delete_reservation(Entreprise.find(@reservation.entreprise_id), @reservation).deliver_now
      ApplicationMailer.delete_rendezvous(Entreprise.find(@reservation.entreprise_id), @reservation).deliver_now
      redirect_to vos_rendez_vous_path
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :hour, :minute, :description, :address, :phone, :postal_code, :entreprise_id)
  end

end
