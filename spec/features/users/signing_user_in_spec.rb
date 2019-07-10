require 'rails_helper'

RSpec.feature "User sign_in" do

  before do
  	@john = User.create!(email: "john@example.com", password: "password")
  end

  scenario "Sign in successfully" do 

  	visit "/"

  	click_link "Sign in"
  	fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as: #{@john.email}")
    expect(page).to have_link("Sign out")
    expect(page).to_not have_link("Sign up")
    expect(page).to_not have_link("Sign in")

  end

  context 'Sing in unsuccessfully' do 
    
    scenario "wrong details" do 

      visit "/"

      click_link "Sign in"
      fill_in "Email", with:"name"
      fill_in "Password", with: "pass"
      click_button "Log in"

      expect(page).to have_content("Invalid Email or password.")
      expect(page).to have_link("Sign up")
      expect(page).to have_link("Sign in")

    end

    scenario "loged in already" do

      visit "/"

      click_link "Sign in"
      fill_in "Email", with: @john.email
      fill_in "Password", with: @john.password
      click_button "Log in"

      visit "/users/sign_in"

      expect(page).to have_content("You are already signed in.")
      expect(page).to have_content("Signed in as: #{@john.email}")

    end

  end

end 