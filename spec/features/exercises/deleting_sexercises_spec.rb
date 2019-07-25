require "rails_helper"

  before do 
  	@john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
  	@johns_exercise = @john.exercises.create!(duration_in_min: 240,
  											  workout:"lorem_ipsum",
  											  workout_date: 3.day.ago)
    login_as(@john)
  end