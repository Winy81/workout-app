require "rails_helper"

RSpec.feature "Following Friends" do 

  before do 
  	@john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
  	@jane = User.create(first_name: "Jane", last_name: "Doe", email: "jane@example.com", password: "password")
  end

  login_as(@john)

end