class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    projects_path
  end

end