require "nokogiri"
require "open-uri"
require 'json'
require_relative 'view'
require_relative 'recipe'

class ScrapeAllrecipesServices
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    recipe = []
    # file = "/Users/tashikacruz/code/tashseb/fullstack-challenges/02-OOP/04-Cookbook-Day-Two/01-Cookbook-Advanced/lib/cheesecake.html"
    # html = File.open(file)
    # doc = Nokogiri::HTML(html)
    html_content = URI.open("https://www.bbcgoodfood.com/search?q=#{@keyword}", "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0").read
    doc = Nokogiri::HTML(html_content)
    info_hash = JSON.parse(doc.search('.js-search-data').text)["results"]

    doc.search(".standard-card-new").first(5).map do |card|
      name = card.search('.standard-card-new__article-title').text.strip
      info_hash.find do |recipe_hash|
       if recipe_hash['title'] == name
        title = recipe_hash['title']
        descp = recipe_hash['description']
        user_rating = recipe_hash['userRatings']['starRatingAverage']
        time = recipe_hash['totalTimeArray']['totalTimeHumanReadable']
        recipe << Recipe.new(title, descp, user_rating, time)
       end
      end
    end
    recipe
  end
end
