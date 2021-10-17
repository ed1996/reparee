class FacturesController < ApplicationController

  before_action :set_facture, only: [:show]
  before_action :authenticate_user!
  before_action :require_same_user, only: [:show]

  def index
    @factures = current_user.factures
  end

  def show
    @facture = Facture.find(params[:id])
    @user = @facture.user
    @num = rand 1000..10000
    @facture_num = 1

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Facture Num. #{@facture.id}",
               page_size: 'A4',
               template: "factures/show.html.erb",
               layout: "pdf.html",
               orientation: "Landscape",
               lowquality: true,
               zoom: 1,
               dpi: 75
      end
    end
  end

  private
  def set_facture
    @facture = Facture.find(params[:id])
  end

  def require_same_user
    if current_user.id != @facture.user_id
      flash[:danger] = "Vous n'avez pas le droit de consulter cette facture"
      redirect_to root_path
    end
  end
end
