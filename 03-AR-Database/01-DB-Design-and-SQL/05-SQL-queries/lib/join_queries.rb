require 'sqlite3'


def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  query = <<~SQL
    SELECT tracks.name, albums.title, artists.name FROM tracks
    JOIN albums ON tracks.album_id = albums.id
    JOIN artists ON albums.artist_id = artists.id
  SQL
  db.execute(query)
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  db.results_as_hash = true
  query = <<~SQL
    SELECT ROUND(AVG(t.milliseconds)/60000,2) avg_length,
      g.name category,
      COUNT(t.name) number_of_songs
    FROM tracks t
      JOIN genres g ON t.genre_id = g.id
    WHERE g.name = '#{genre_name}'
  SQL
  table = db.execute(query)
  table.first.transform_keys(&:to_sym)
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
  query = <<~SQL
    SELECT art.id, art.name, COUNT(t.name) num
    FROM tracks t
      LEFT JOIN albums a ON a.id = t.album_id
      JOIN artists art ON art.id = a.artist_id
      JOIN genres g ON t.genre_id = g.id
    WHERE g.name = '#{genre_name}'
    GROUP BY art.name
    ORDER BY num DESC
    LIMIT 5
  SQL
  top_five = db.execute(query)
  # top_five
end
