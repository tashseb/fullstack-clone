require "json"
require "rest-client"

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
url = "https://hacker-news.firebaseio.com/v0/topstories.json"
response = RestClient.get(url)
repos = JSON.parse(response).first(10)
repos.collect do |post|
  p post
end
# 10.times do |p|
#   post = Post.new(
#     title: ,
#     url: ,
#     votes:
#   )
# end
