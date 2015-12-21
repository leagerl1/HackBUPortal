require 'rails_helper'

RSpec.describe User, type: :model do
    before :each do
        @user = FactoryGirl.create(:user)
        project1 = Project.create(:name => "My Project", :description => "This is a test", :owner_id => @user.id)
        project2 =  Project.create(:name => "My Project2", :description => "This is a test2", :owner_id => @user.id)
        @user.projects << project1 << project2
    end
    
    describe "#new" do
        it "takes name and last name and returns a User object" do
           expect(@user).to be_an_instance_of User 
        end
    end
    
    describe "#owner_projects" do
        it "returns a collection of the projects the user owns" do
            expect(@user.owned_projects).to eq(Project.where(:owner_id => @user.id))
        end 
    end
 
end
