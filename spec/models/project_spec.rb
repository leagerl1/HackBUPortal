require 'rails_helper'

RSpec.describe Project, type: :model do

    before :each do
        @user = FactoryGirl.create(:user)
        @project = FactoryGirl.create(:project, :owner_id => @user.id)
    end  
  
  
  
  describe '#owner' do 
    it "takes the project and returns the owner" do
        expect(@project.owner).to eq(@user) 
    end
  end
  
  
end