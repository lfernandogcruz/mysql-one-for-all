SELECT
A.artist_name AS artista,
R.album_title AS album

FROM SpotifyClone.album AS R
INNER JOIN SpotifyClone.artists AS A
ON A.artist_id = R.album_artist

WHERE A.artist_name = "Walter Phoenix";