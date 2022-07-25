SELECT U.user_name AS usuario,
COUNT(H.track_id) AS qtde_musicas_ouvidas,
ROUND(SUM(T.track_duration)/60, 2) AS total_minutos

FROM SpotifyClone.users AS U
INNER JOIN SpotifyClone.play_history AS H
ON U.user_id = H.user_id
INNER JOIN SpotifyClone.tracks AS T
ON H.track_id = T.track_id

GROUP BY usuario
ORDER BY usuario;