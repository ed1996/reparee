class PhotosController < ApplicationController

    def destroy

      @photo = Photo.find(params[:id])
      entreprise = @photo.entreprise

      @photo.destroy

      @photos = Photo.where(entreprise_id: entreprise.id)

      respond_to :js
    end

end
