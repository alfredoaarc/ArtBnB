class RentalsController < ApplicationController
  def new
    @rental = Rental.new
    @artwork = Artwork.find(params[:artwork_id])
  end

  def create
    @rental = Rental.new(rental_params)
    @artwork = Artwork.find(params[:artwork_id])
    raise
    @rental.artwork = @artwork
    @rental.user = current_user
    if @rental.save
      redirect_to artwork_path(@artwork)
    else
      render :new
    end
  end
  def rental_params
  params.require(:rental).permit(:start_time, :end_time)
  end
end
