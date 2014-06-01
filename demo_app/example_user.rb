class User
attr_accessor :name, :email
def initialize(attribute = {})
	@name = attribute[:name]
	@email = attribute[:email]
end
def email_giver
	"your email is #{@name}@#{@email}.com"
end
end