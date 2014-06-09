require 'spec_helper'


describe SessionsController do
render_views
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
			flash.now[:error].should =˜ /invalid/i
		end
		
	end
				
end
end
