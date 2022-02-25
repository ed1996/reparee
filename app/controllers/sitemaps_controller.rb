class SitemapsController < ApplicationController

  layout :false
  before_action :init_sitemap

  def index
    @entreprises = Entreprise.all
  end

  private

  def init_sitemap
    headers['Content-Type'] = 'application/xml'
  end

  # pour modifier le sitemap le remettre en .builder a la fin deuxieme essaie, try

end
