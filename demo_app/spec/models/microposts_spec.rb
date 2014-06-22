require 'spec_helper'

describe Micropost do
	before (:each) do 
		@attr = { :content => "value of the content", :user_id => 1}
	end
	it"should create new instance of micropost" do
	Micropost.create!(@attr)
	end

end