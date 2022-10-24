require "faker"
require_relative '../app/models/post'
# TODO: Write a seed to insert 100 posts in the database
100.times do |_i|
  post = Post.new(
    title: Faker::Coffee.variety,
    url: Faker::Address.city,
    votes: rand(1..100)
  )
  post.save!
end
