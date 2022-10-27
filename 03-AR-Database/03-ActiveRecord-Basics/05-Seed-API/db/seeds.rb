require "json"
require "rest-client"
require "open-uri"
require "nokogiri"
# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
url = "https://hacker-news.firebaseio.com/v0/topstories.json"
response = RestClient.get(url)
repos = JSON.parse(response).first(10)
repos.each do |id|
  html_content = URI.open("https://news.ycombinator.com/item?id=#{id}")
  doc = Nokogiri::HTML(html_content)
  info_hash = JSON.parse(doc.search()) 
end
# 10.times do |p|
#   post = Post.new(
#     title: ,
#     url: ,
#     votes:
#   )
# end
