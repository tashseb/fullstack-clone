require 'nokogiri'
require 'open-uri'
# /Users/tashikacruz/code/tashseb/fullstack-challenges/01-Ruby/06-Parsing/Reboot-01-Christmas-list/lib
 def scraper(article)
  # filepath = "results.html"
  # html_content = File.open(filepath)
  # doc = Nokogiri::HTML(html_content)
  html_content = URI.open("https://www.etsy.com/search?q=#{article}", "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0").read
  doc = Nokogiri::HTML(html_content)

  etsy_list = {}
  doc.search('.v2-listing-card__info .v2-listing-card__title').first(5).each do |element|
    gift = element.text.strip.split.first(5).join(' ')
    etsy_list[gift] = false
  end
  etsy_list
end
