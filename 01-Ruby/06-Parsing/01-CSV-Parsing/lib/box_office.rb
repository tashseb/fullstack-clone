require 'csv'

FILEPATH = '/Users/tashikacruz/code/tashseb/fullstack-challenges/01-Ruby/06-Parsing/01-CSV-Parsing/lib/movies.csv'
movie_list = {}

def parse_csv(path, list)
  CSV.foreach(path, headers: :first_row, header_converters: :symbol) do |row|
    year = row[:year]
    earnings = row[:view]
    list[row["name"]] = { year, earnings }
  end
end


def most_successful(number, max_year, file_path)
  # TODO: return an array of most successful movies before `max_year`
end

parse_csv(FILEPATH, movie_list)
