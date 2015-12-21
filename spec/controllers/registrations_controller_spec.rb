require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
 
 it "redirects to the projects index" do pending
    sign_in
    
    get :after_sign_up_path_for
    
    expect(response).to redirect_to(projects_path)
 end
 
end
