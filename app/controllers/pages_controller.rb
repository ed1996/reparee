class PagesController < ApplicationController

  def home
    @entreprises = Entreprise.order("RAND()").limit(3)
    # Attention la fonction RANDOM ne marche que sur heroku et pas en local il faut mettre RAND pour tester en local
  end

  def faq

  end

  def team

  end

  def features

  end

  def contact

  end

  def abonnement

  end

  def homesaas

  end

  def search
    if params[:search].present? && params[:search].strip != ""
      session[:company_search] = params[:search]
    end

    arrResult = Array.new

    if session[:company_search] && session[:company_search] != ""
      @company_address = Entreprise.where(active: true, artisan_type: params[:artisan_type]).near(session[:company_search], 5, order:'distance')
    else
      @company_address = Entreprise.where(active: true).all
    end

    @search = @company_address.ransack(params[:q])
    @entreprises = @search.result

    @arrReparee = @entreprises.to_a





    @searchies = Entreprise.ransack(params[:q])
    @products = @searchies.result(distinct: true)

  end
end
