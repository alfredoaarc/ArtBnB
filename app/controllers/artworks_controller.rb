class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def show
    @artwork = Artwork.find(params[:id])
    @rental = Rental.new
  end



  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artworks_params)
    @artwork.user = current_user
    @artwork.save
    #this will load a brand new page
    redirect_to artwork_path(@artwork)
  end

  private

  def artworks_params
    params.require(:artwork).permit(
      :title,
      :description,
      :photo,
      :location,
      :price,
      :category
    )
  end
end
