class PagesController < ApplicationController

  def home
    @entreprises = Entreprise.order("RANDOM()").limit(3)
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

  def search
    if params[:search].present? && params[:search].strip != ""
      session[:entreprises_search] = params[:search]
    end

    arrResult = Array.new

    if session[:entreprises_search] && session[:entreprises_search] != ""
      @company_address = Entreprise.where(active: true, artisan_type: params[:artisan_type]).near(session[:entreprises_search], 5, order:'distance')
    else
      @company_address = Entreprise.where(active: true).all
    end

    @search = @company_address.ransack(params[:q])
    @entreprises = @search.result

    @arrReparee = @entreprises.to_a



    @searching = Entreprise.ransack(params[:q])
    @companies = @searching.result

    @arrCompanies = @companies.to_a


    @searchies = Entreprise.ransack(params[:q])
    @products = @searchies.result(distinct: true)

  end
end
