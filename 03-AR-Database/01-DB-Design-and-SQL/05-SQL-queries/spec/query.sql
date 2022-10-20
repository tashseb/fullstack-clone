-- SQLite

SELECT art.name
FROM tracks t
  JOIN albums a ON a.id = t.album_id
  JOIN artists art ON art.id = a.artist_id
  JOIN genres g ON t.genre_id = g.id
WHERE g.name = 'Rock'
GROUP BY art.name
LIMIT 5

-- SELECT * FROM tracks
