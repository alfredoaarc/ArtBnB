class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @skip_navbar = true
    @skip_footer = true
    redirect_to artworks_path if user_signed_in?
  end

  def requests
    @requests = current_user.rentals
    #preguntar a que boton conectar y preguntar a cómo contectarlo
  end

  def my_artworks
    @my_artworks = current_user.artworks
  end
end
