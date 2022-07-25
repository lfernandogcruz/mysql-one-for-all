SELECT
T.track_title AS cancao,
COUNT(H.track_id) AS reproducoes

FROM SpotifyClone.tracks AS T
INNER JOIN SpotifyClone.play_history AS H
ON T.track_id = H.track_id

GROUP BY H.track_id
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;