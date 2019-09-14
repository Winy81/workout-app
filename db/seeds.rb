require 'date'


User.create!(
  first_name: "John", 
  last_name: "Doe", 
  email: "john@example.com", 
  password: "password"
)

puts "John as user has been created"

User.create!(
  first_name: "Jane", 
  last_name: "Doe", 
  email: "jane@example.com", 
  password: "password"
)

puts "Jane as user has been created"

User.create!(
  first_name: "Henry", 
  last_name: "Doe", 
  email: "henry@example.com", 
  password: "password"
)

puts "Henry as user has been created"



25.times do |user|
  User.create!(
    first_name: "#{user}.Test", 
    last_name: "User", 
    email: "#{user}TestUser@example.com", 
    password: "password"
  )
end

puts "20 random User has been created"


30.times do |exercise|
  Exercise.create!(
  	duration_in_min: rand(25..450).to_s,
  	workout: "This is duty of #{exercise}",
  	workout_date: Date.today.next_day(rand(1..20)),
  	user_id: rand(1..3)
  )
end

puts "30 random exercises has been created, duration_in_min workout date is random and the owner User is one of the main 3 users."

20.times do |frinedship|
  if rand(0..1) == 1
    Friendship.create!(	
	  user_id: 1,
    friend_id: frinedship + 3
    )
  end

  if rand(0..1) == 1
    Friendship.create!( 
    user_id: 2,
    friend_id: frinedship + 3
    )
  end

  if rand(0..1) == 1
    Friendship.create!( 
    user_id: 3,
    friend_id: frinedship + 3
    )
  end
end

puts "Friendships has been created for John"
puts "Friendships has been created for Jane"
puts "Friendships has been created for Henry"

