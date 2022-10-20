require 'sqlite3'

def artist_count(db)
  total_artist = db.execute('SELECT COUNT(*) FROM artists')
  total_artist[0][0]
end

def number_of_rows(db, table_name)
  total_tracks = db.execute("SELECT COUNT(*) FROM #{table_name}")
  total_tracks[0][0]
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  artists_sorted = db.execute('SELECT name FROM artists ORDER BY name ASC')
  artists_sorted.flatten
end

def love_tracks(db)
  # TODO: return array of love songs' names
  love_tracks = db.execute("SELECT name FROM tracks WHERE name LIKE '%love%'")
  love_tracks.flatten
end

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending)
  query = <<~SQL
    SELECT tracks.name
    FROM tracks
    WHERE milliseconds/1000/60 >= #{min_length}
    ORDER BY milliseconds
  SQL
  result = db.execute(query)
  result.flatten
end
