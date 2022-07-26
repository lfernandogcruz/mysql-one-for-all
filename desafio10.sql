SELECT
T.track_title AS nome,
COUNT(H.track_id) AS reproducoes

FROM SpotifyClone.tracks AS T
INNER JOIN SpotifyClone.play_history AS H
	ON T.track_id = H.track_id
INNER JOIN SpotifyClone.users AS U
	ON H.user_id = U.user_id
INNER JOIN SpotifyClone.planos AS P
	ON U.user_plano = P.plano_id

WHERE P.plano_titulo IN ("gratuito", "pessoal")

GROUP BY nome
ORDER BY reproducoes DESC, nome ASC;