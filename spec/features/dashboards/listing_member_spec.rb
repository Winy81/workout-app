require "rails_helper"

RSpec.feature "Listing members" do 

  before do 
  	@john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
  	@jane = User.create(first_name: "Jane", last_name: "Doe", email: "jane@example.com", password: "password")
  end

  scenario "Listing all registered users" do 

  	visit "/" 
   
  	expect(page).to have_conent("List of Members")
    expect(page).to have_conent("@john.full_name")
    expect(page).to have_conent("@jane.full_name")
  end
end