class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  
  
  def authenticate_has_profile
    if !current_user.profile.present?
        redirect_to new_profile_path,
        notice: 'Please fill out a profile before continuing' 
    end
  end
  
end
