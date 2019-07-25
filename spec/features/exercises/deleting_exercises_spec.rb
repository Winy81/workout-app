require "rails_helper"

RSpec.feature "Deleting exercise" do

  before do 
  	@john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
  	@johns_exercise = @john.exercises.create!(duration_in_min: 240,
  											  workout:"lorem_ipsum",
  											  workout_date: 3.day.ago)
    login_as(@john)
  end

  scenario "Delete a exercise successfully" do
  	
  	visit "/"

  	click_link "My Lounge"

  	path = "/users/#{@john.id}/exercises/#{@johns_exercise.id}"
  	click_link('Destroy', :href => path)

  	expect(page).not_to have_content("lorem_ipsum")
    expect(page).not_to have_content(240)
    expect(page).not_to have_content(3.day.ago)

  end

end