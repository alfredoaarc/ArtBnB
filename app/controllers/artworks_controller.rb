class ArtworksController < ApplicationController

  def index
    @artworks = Artwork.all
  end

  def show
    @artwork = Artwork.find(artwork_params)
  end
  # POST /artwork

  private

  def artwork_params
    params.require(:artwork).permit(:title, :location)
  end

end
