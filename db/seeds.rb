puts "Destroying everything..."
Bark.destroy_all
User.destroy_all
Following.destroy_all

puts "Creating a User..."

User.create(
  name: "Alex",
  email: "alex@test.com",
  handle: "architect",
  password: "administrator999"
).photo.attach(io: File.open('app/assets/images/users/alex.png'), filename: 'alex.png')

User.create(
  name: "Reina",
  email: "reina@test.com",
  handle: "wife",
  password: "alexsuki123"
).photo.attach(io: File.open('app/assets/images/users/reina.png'), filename: 'reina.png')

User.create(
  name: "Tofu",
  email: "tofu@test.com",
  handle: "pet",
  password: "alwaysmoody123"
).photo.attach(io: File.open('app/assets/images/users/tofu.png'), filename: 'tofu.png')

puts "Creating Barks.."

10.times do
  Bark.create(user_id: 2, message: Faker::Quote.matz)
end

10.times do
  Bark.create(user_id: 3, message: Faker::Quote.matz)
end
