require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
    it "blocks unauthenticated access" do 
        login_user nil
        
        get :index

        expect(response).to redirect_to(new_user_session_path)
    end
    
    it "allows authenticated access" do
        login_user

        get :index

        expect(response).to be_success
  end
  
  it "sends request notification to owner of project" do
      user = FactoryGirl.create(:user)
      login_user user
      project = FactoryGirl.create(:project, :owner_id => user.id)
      get :request_to_owner, :id => user.id.to_s
      
      expect(response).to redirect_to projects_path
  end
end
