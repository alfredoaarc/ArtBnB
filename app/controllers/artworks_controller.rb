class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def show
    @artwork = Artwork.find(params[:id])
  end
  # POST /artwork
  def search

  end

  private

  def artwork_params
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
