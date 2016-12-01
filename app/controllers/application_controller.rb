class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :get_location

  protected

  def get_location
		unless params[:lat].nil? || params[:lng].nil?
			current_user.profile.update(:lat => params[:lat].to_f, :lng => params[:lng].to_f)
		end
  end

  def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
  end
end
