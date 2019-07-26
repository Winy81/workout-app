require 'rails_helper'

RSpec.feature "Users sign_up" do 

   scenario "with valid details" do 

     visit "/"

     click_link "Sign up"
     fill_in "First name", with: "John"
     fill_in "Last name", with: "Doe"
     fill_in "Email", with: "john@example.com"
     fill_in "Password", with: "password"
     fill_in "Password confirmation", with: "password"
     click_button "Sign up"

     expect(page).to have_content("Welcome! You have signed up successfully.")
     expect(page).to have_link("Sign out")
     expect(page).to_not have_link("Sign up")
     expect(page).to_not have_link("Sign in")

     visit "/"

     expect(page).to have_content("John Doe")

   end

   scenario "with invalid details" do 

     visit "/"

     click_link "Sign up"
     fill_in "First name", with: "John"
     fill_in "Last name", with: "Doe"
     fill_in "Email", with: "john@example.com"
     fill_in "Password", with: ""
     fill_in "Password confirmation", with: ""
     click_button "Sign up"

     expect(page).to have_content("Password can't be blank")
     expect(page).to have_link("Sign up")
     expect(page).to have_link("Sign in")

   end
end