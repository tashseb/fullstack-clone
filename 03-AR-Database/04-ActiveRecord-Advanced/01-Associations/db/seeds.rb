require 'faker'

puts "Seeding database with users and posts..."

5.times do |_n|
  user = User.create(
    username: Faker::Name.middle_name,
    email: Faker::Internet.email
  )
  5.times do |_p|
    post = Post.create(
      title: Faker::Appliance.brand,
      url: Faker::Internet.email,
      votes: rand(1..100),
      user_id: user.id
    )
  end
end
