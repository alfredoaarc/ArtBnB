class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @skip_navbar = true
    @skip_footer = true
    redirect_to artworks_path if user_signed_in?
  end

  def requests
    @requests = current_user.rentals
    @my_artworks = current_user.artworks
     #preguntar a que boton conectar y preguntar a cómo contectarlo
  end
end

  #preguntar a que boton conectar y preguntar a cómo contectarlo


  #create routes request then controller in pages then view
