SELECT
U.user_name AS usuario,
IF(MAX(H.reproduction_date) LIKE("2021%"), "Usuário ativo", "Usuário inativo") AS condicao_usuario

FROM SpotifyClone.users AS U
INNER JOIN SpotifyClone.play_history AS H
ON U.user_id = H.user_id

GROUP BY usuario
ORDER BY usuario;