require 'spec_helper'

describe User do
before(:each) do
@attr = { :name => "Example User", :email => "user@example.com" }
end
it "should create a new instance given valid attributes" do
User.create!(@attr)
end
it "should require a name" do
no_name_user = User.new(@attr.merge(:name => ""))
no_name_user.should_not be_valid
end
it "should require an email" do
no_name_user = User.new(@attr.merge(:email => ""))
no_name_user.should_not be_valid
end
it "should have maximum 50 characters in name" do
long_name = "a" * 51
long_name_user = User.new(@attr.merge(:name => long_name))
long_name_user.should_not be_valid
end
it "should accept valid email addresses" do
addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
addresses.each do |address|
valid_email_user = User.new(@attr.merge(:email => address))
valid_email_user.should be_valid
end
end
it "should reject invalid email addresses" do
addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
addresses.each do |address|
invalid_email_user = User.new(@attr.merge(:email => address))
invalid_email_user.should_not be_valid
end
end
it "should should reject duplicates" do
	User.create!(@attr)
	duplicate_record = User.new(@attr)
	duplicate_record.should_not be_valid
end
it "should reject uppercase duplicates of email" do
	duplicate_upcase_email = @attr[:email].upcase
	User.create!(@attr.merge(:email => duplicate_upcase_email))
	duplicate_upcase_email.should_not be_valid
end
end