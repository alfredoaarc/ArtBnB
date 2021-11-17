class PagesController < ApplicationController
  def home
    @skip_navbar = true
    @skip_footer = true
  end
end
