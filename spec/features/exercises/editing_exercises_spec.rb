require 'rails_helper'

RSpec.feature "Editing exercise" do 

  before do 
  	@john = User.create!(email: "john@example.com", password: "password")
  	@johns_exercise = @john.exercises.create!(duration_in_min: 240,
  											  workout:"lorem_ipsum"
  											  workout_date: 3.day.ago)
  	login_as(@john)
  end

end