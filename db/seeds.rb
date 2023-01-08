puts "Destroying everything..."
Bark.destroy_all
User.destroy_all
Following.destroy_all

puts "Creating a User..."

User.create(
  name: "Alex",
  email: "alex@test.com",
  handle: "admin",
  password: "pass123"
).photo.attach(io: File.open('app/assets/images/users/alex.png'), filename: 'alex.png')

User.create(
  name: "Reina",
  email: "reina@test.com",
  handle: "wife",
  password: "pass123"
).photo.attach(io: File.open('app/assets/images/users/reina.png'), filename: 'reina.png')

User.create(
  name: "Tofu",
  email: "tofu@test.com",
  handle: "pet",
  password: "pass123"
).photo.attach(io: File.open('app/assets/images/users/tofu.png'), filename: 'tofu.png')

puts "Creating Barks.."

20.times do
  Bark.create(user_id: rand(1..3), message: Faker::Games::StreetFighter.quote)
end

puts "Creating Followers..."

2.times do
  Following.create(followed_id: rand(1..3), follower_id: rand(1..3))
end
