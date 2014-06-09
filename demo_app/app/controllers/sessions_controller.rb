class SessionsController < ApplicationController
  def new
  	@title = "sign in"
  end
  def create
  	user = User.authenticate(params[:session][:email], params[:session][:password])
  	if user.nil?
  		flash.now[:error] = "Invalid Email Password Combination"
  		@title = "sign in"
  		render 'new'
  	else
  		#signin n render show page
  	end
  end
  def destroy
  end
end
