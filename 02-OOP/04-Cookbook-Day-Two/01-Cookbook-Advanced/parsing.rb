require "nokogiri"
file = "banana.html"
doc = Nokogiri::HTML(File.open(file), nil, "utf-8")
recipe = []

doc.search(".card__content .card__title").first(5).each do |element|
  recipe << element.text.strip
end
