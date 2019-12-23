class EntreprisesController < ApplicationController

  before_action :set_enterprise, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @entreprises = current_user.entreprises
  end

  def new
    @entreprise = current_user.entreprises.build
  end

  def create
    @entreprise = current_user.entreprises.build(entreprise_params)
    if @entreprise.save
      if params[:images]
        params[:images].each do |i|
          @entreprise.photos.create(image: i)
        end
      end
      @photos = @entreprise.photos
      redirect_to edit_entreprise_path(@entreprise), notice:"Votre entreprise a été ajouté avec succès"
    else
      render :new
    end
  end

  def show
    @photos = @entreprise.photos
  end

  def edit
    @photos = @entreprise.photos
  end

  def update
    if @entreprise.update(entreprise_params)
      if params[:images]
        params[:images].each do |i|
          @entreprise.photos.create(image: i)
        end
      end
      @photos = @entreprise.photos
      redirect_to edit_entreprise_path(@entreprise), notice:"Modifications enregistrée..."
    else
      render :edit
    end
  end

  private
  def set_enterprise
    @entreprise = Entreprise.find(params[:id])
  end

  def entreprise_params
    params.require(:entreprise).permit(:artisan_type, :company_name, :code_naf, :siren, :siret, :address, :phone, :legal_form, :linkweb, :is_card, :is_cheque, :is_cash, :active)
  end

  def require_same_user
    if current_user.id != @entreprise.user_id
      flash[:danger] = "Vous n'avez pas le droit de modifier cette entreprise"
      redirect_to root_path
    end
  end

end
