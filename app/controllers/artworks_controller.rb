class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
    @top_picks = Artwork.all.sample(3)
    # Search
    if params[:search].present?
      if params[:search][:category].present?
        @artworks = Artwork.search_by_category(params[:search][:category])
      elsif params[:search][:location].present?
        @artworks = Artwork.search_by_location(params[:search][:location])
      else
        @artworks = @top_picks
      end
    else
      @artworks = Artwork.all
    end
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
    #this will load the newly added artwork page
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
