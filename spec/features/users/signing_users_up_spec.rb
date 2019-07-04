require 'rails-helper'

RSpec.feature "Users sign_up" do 

   scenario "with valid details" do 

     visit "/"

     click_link "Sing up"
     fill_in "Email", with: "john@example.com"
     fill_in "Password", with: "password"
     click_button "Sign_up"

     expect(page).to have_content("You have signed up successfully.")

   end
end