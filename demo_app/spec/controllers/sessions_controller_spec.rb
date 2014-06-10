require 'spec_helper'


describe SessionsController do
render_views
describe "DELETE 'destroy'" do
it "should sign a user out" do
test_sign_in(Factory(:user))
delete :destroy
controller.should_not be_signed_in
response.should redirect_to(root_path)
end
end
  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
    it "should have the right title" do
    get 'new'
    response.should have_selector("title", :content => "sign in")
  end
end
describe "POST 'Create" do
	describe "invalid signin" do
		before(:each) do
			@attr = {:email => "email@example.com", :password => "invalid"}
		end
		it "should render a new page" do
			post :create, :session => @attr
			response.should render_template('new')
		end
		it "should have right title" do
			post :create, :session => @attr
			response.should have_selector("title", :content => "sign in")
		end
		it "should have a flash now message" do
			post:create, :session => @attr
			flash.now[:error].should =~ /invalid/i
		end
		
	end
	describe "valid signin" do
		before(:each) do
			@user = Factory(:user)
			@attr = {:email => "email@example.com", :password => "invalid"}
		end
			it "should sign the user in" do
				post :create, :session => @attr
				controller.current_user.should == @user
				controller.should be_signed_in
			end
			it "should show profile page" do
				post :create, :session => @attr
				response.should redirect_to(user_path(@user))
			end
		end
	end	
end
