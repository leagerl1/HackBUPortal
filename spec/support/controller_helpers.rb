module ControllerHelpers
  
  def login_user(user = User.create(:name => "Test", :last_name => "Person", :id => 1))
      if user.nil?
        allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
        allow(controller).to receive(:current_user).and_return(nil)
      else
        sign_in user
        allow(request.env['warden']).to receive(:authenticate!).and_return(user)
        allow(controller).to receive(:current_user).and_return(user)
      end
  end
  
end