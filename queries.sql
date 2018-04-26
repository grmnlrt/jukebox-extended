-- Customer list
SELECT first_name, last_name, email
FROM customers
ORDER BY last_name

-- Classical Playlist
SELECT tracks.name, tracks.composer
FROM tracks
JOIN playlist_tracks ON tracks.id = playlist_tracks.track_id
JOIN playlists ON playlist_tracks.playlist_id = playlists.id
WHERE playlists.name = 'Classical'

-- 10 mostly listed artists
SELECT artists.name, COUNT(*) AS occurences
FROM artists
JOIN albums ON artists.id = albums.artist_id
JOIN tracks ON albums.id = tracks.album_id
JOIN playlist_tracks ON tracks.id = playlist_tracks.track_id
GROUP BY artists.name
ORDER BY occurences DESC
LIMIT 10

-- Tracks purchased at least twice
SELECT tracks.name, COUNT(*) AS counter
FROM tracks
JOIN invoice_lines ON tracks.id = invoice_lines.track_id
GROUP BY tracks.name
HAVING counter >= 2
ORDER BY counter DESC

