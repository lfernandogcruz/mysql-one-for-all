SELECT
COUNT(H.track_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.users AS U
INNER JOIN SpotifyClone.play_history AS H
ON U.user_id = H.user_id

WHERE U.user_name = "Bill";