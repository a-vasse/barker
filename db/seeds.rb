puts "Destroying everything..."
Bark.destroy_all
User.destroy_all
Following.destroy_all

puts "Creating a user..."

User.create(
  name: "Alex",
  email: "alex@test.com",
  password: "pass123",
)

User.create(
  name: "Reina",
  email: "reina@test.com",
  password: "pass123",
)

User.create(
  name: "Tofu",
  email: "tofu@test.com",
  password: "pass123",
)

puts "Creating Barks.."

20.times do
  Bark.create(user_id: rand(1..3), message: Faker::Games::StreetFighter.quote)
end

puts "Creating a followers..."
2.times do
  Following.create(followed_id: rand(1..3), follower_id: rand(1..3))
end
