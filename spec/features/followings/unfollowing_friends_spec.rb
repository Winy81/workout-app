require 'rails_helper'

RSpec.feature "Unfollowing Friend" do
  before do
    @john = User.create(first_name: "John",
                        last_name: "Doe",
                        email: "john@example.com",
                        password: "password")
    @jane = User.create(first_name: "Sarah",
                        last_name: "Anderson",
                        email: "sarah@example.com",
                        password: "password")
    login_as(@john)

    @following = Friendship.create(user: @john, friend: @jane)
  end

end