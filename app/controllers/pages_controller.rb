class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    end
end
 before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:start_time, :end_time])

    devise_parameter_sanitizer.permit(:account_update, keys: [:start_time, :end_time])
  end
end
