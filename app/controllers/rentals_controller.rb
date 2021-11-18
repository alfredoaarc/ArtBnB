class RentalsController < ApplicationController
  def new
    @rental = Rental.new
  end

  def create
    @artwork = Artwork.find(params[:artwork_id])
    @rental = Rental.new(rental_params)
    @rental.artwork = @artwork
    @rental.user = current_user
    if @rental.save
      redirect_to artwork_path(@artwork), notice: 'Booking complete!'

    else
      render :new
    end
  end

  def rental_params
    params.require(:rental).permit(:start_time, :end_time)
  end
end
