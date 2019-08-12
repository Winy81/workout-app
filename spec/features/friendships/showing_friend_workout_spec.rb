require "rails_helper"

RSpec.feature "Showing Friends Workout" do
  
  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
    @jane = User.create(first_name: "Jane", last_name: "Doe", email: "jane@example.com", password: "password")

  	login_as(@john)
    
    @e1 = @john.exercises.create(duration_in_min: 20,
                                 workout: "My body building activity",
                                 workout_date: Date.today)
                                  
    @e2 = @jane.exercises.create(duration_in_min: 55,
                                 workout: "Weight lifting",
                                 workout_date: 2.days.ago)

    @following = Friendship.create(user: @john, friend: @jane)
  end

  scenario "shows friend's workout for last 7 days" do
    visit "/"

    click_link "My Lounge"
    click_link @jane.full_name

    expect(page).to have_content(@jane.full_name + "'s Exercises")
    expect(page).to have_content(@e2.workout)
    expect(page).to have_css("div#chart")
  end
end