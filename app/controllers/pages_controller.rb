class PagesController < ApplicationController
  def home
  end

  def artwork_params
    params.require(:article).permit(:title, :body, :photo)
  end
end
