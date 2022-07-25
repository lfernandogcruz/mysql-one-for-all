SELECT
MIN(P.plano_valor) AS faturamento_minimo,
MAX(P.plano_valor) AS faturamento_maximo,
ROUND(AVG(P.plano_valor), 2) AS faturamento_medio,
SUM(P.plano_valor) AS faturamento_total

FROM SpotifyClone.planos AS P
INNER JOIN SpotifyClone.users AS U
ON P.plano_id = U.user_plano;