require "rails_helper"

RSpec.feature "Sending a message" do
  before do
    @john = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password')
    @jane = User.create!(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', password: 'password')
    @henry = User.create!(first_name: 'Henry', last_name: 'Flynn', email: 'henry@example.com', password: 'password')
    
    @room_name = @john.first_name + '-' + @john.last_name
    @room = Room.create!(name: @room_name, user_id: @john.id)
    
    login_as(@john)
    
    Friendship.create(user: @jane, friend: @john)
    Friendship.create(user: @henry, friend: @john)
  end