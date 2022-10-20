require 'sqlite3'

def all_artists(db)
  query = <<~SQL
    SELECT * FROM artists
  SQL
  artist_ids = db.execute(query)
end
