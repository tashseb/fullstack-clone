SELECT tracks.name 
FROM tracks
WHERE milliseconds/1000/60 >= 45
ORDER BY milliseconds
