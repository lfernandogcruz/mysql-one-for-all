SELECT
A.artist_name AS artista,
D.album_title AS album,
COUNT(F.user_id) AS seguidores

FROM SpotifyClone.artists AS A
RIGHT JOIN SpotifyClone.album AS D
ON A.artist_id = D.album_artist
INNER JOIN SpotifyClone.followed_artists AS F
ON F.artist_id = A.artist_id

GROUP BY artista, album
ORDER BY seguidores DESC, artista ASC, album ASC;