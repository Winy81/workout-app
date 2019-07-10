require 'rails_hepler'

RSpec.feature "Creating exercise" do 

  before do 
  	@john = User.create!(email: "john@example.com", password: "password")
  	login_as(@john)
  end

end