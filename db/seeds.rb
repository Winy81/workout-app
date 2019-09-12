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
  email: "henry@example.com", 
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




10.times do |user|
	User.create!(
	  first_name: "#{user}Test", 
	  last_name: "User", 
	  email: "#{user}TestUser@example.com", 
	  password: "password"
end

puts "10 random User has been created"