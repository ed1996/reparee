class EntreprisesController < ApplicationController

  before_action :set_enterprise, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @enterprises = current_user.entreprises
  end

  def new
    @entreprise = current_user.entreprises.build
  end

  def create
    @entreprise = current_user.entreprises.build(entreprise_params)
    if @entreprise.save
      redirect_to @enterprise, notice:"Votre entreprise a été ajouté avec succès"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @entreprise.update(entreprise_params)
      redirect_to @entreprise, notice:"Modifications enregistrée..."
    else
      render :edit
    end
  end

  private
  def set_enterprise
    @enterprise = Entreprise.find(params[:id])
  end

  def entreprise_params
    params.require(:entreprise).permit(:artisan_type, :company_name, :code_naf, :siren, :siret, :address, :phone, :legal_form, :linkweb, :is_card, :is_cheque, :is_cash, :active)
  end

end
