class Restaurant
  # TODO: add relevant accessors if necessary
  attr_reader :average_rating, :city

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @average = []
  end
  # TODO: implement .filter_by_city and #rate methods

  def rate(new_rate)
    @average << new_rate
    @average_rating = @average.reduce(:+).fdiv(@average.length)
  end

  def self.filter_by_city(restaurants, city)
    restaurants.select { |restaurant| restaurant.city == city }
  end
end
