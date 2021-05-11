class FacturesController < ApplicationController
  def index
  end

  def show
    @facture = Facture.find(params[:id])
    @user = @facture.user

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
end
