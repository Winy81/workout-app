require 'rails_helper'

RSpec.feature "Creating exercise" do 

  before do 
  	@john = User.create!(email: "john@example.com", password: "password")
  	login_as(@john)
  end

  scenario "with valid input" do 

  	visit "/"

  	click_link "My Lounge"
  	click_link "New Workout"
  	expect(page).to have_button("Back")

  	fill_in "Duration", with: 70
  	fill_in "Workout Details", with: "Weight lifting"
  	fill_in "Activity date", with: "2019-07-03"
  	click_button "Create Exercise"
  end

end