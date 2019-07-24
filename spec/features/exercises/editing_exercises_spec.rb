require 'rails_helper'

RSpec.feature "Editing exercise" do 

  before do 
  	@john = User.create!(email: "john@example.com", password: "password")
  	@johns_exercise = @john.exercises.create!(duration_in_min: 240,
  											  workout:"lorem_ipsum",
  											  workout_date: 3.day.ago)
  	login_as(@john)
  end

  scenario "with valid data succeeds" do 

  	visit "/"

  	click_link "My Lounge"

  	path = "/users/#{@john.id}/exercises/#{@johns_exercise.id}/edit"
  	p path
  	click_link('Edit', :href => path)

  	fill_in "Duration", with: 45
    click_button "Update Exercise"
    
    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(45)
    expect(page).not_to have_content(240)

  end

end