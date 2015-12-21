class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_notifications, if: :user_signed_in?
  

  def set_notifications
    @notifications = current_user.notifications
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name << :last_name << :avatar
    devise_parameter_sanitizer.for(:account_update) << :name << :last_name << :avatar
  end
  
  def after_sign_in_path_for(resource)
    projects_path
  end
  
end
