SELECT
track_title AS nome_musica,
CASE
	WHEN track_title LIKE "%Streets" THEN REPLACE(track_title, "Streets", "Code Review")
	WHEN track_title LIKE "%Her Own" THEN REPLACE(track_title, "Her Own", "Trybe")
	WHEN track_title LIKE "%Inner Fire" THEN REPLACE(track_title, "Inner Fire", "Project")
	WHEN track_title LIKE "%Silly" THEN REPLACE(track_title, "Silly", "Nice")
	WHEN track_title LIKE "%Circus" THEN REPLACE(track_title, "Circus", "Pull Request")
    ELSE NULL
END AS novo_nome

FROM SpotifyClone.tracks

WHERE track_title LIKE "%Streets"
	OR track_title LIKE "%Her Own"
	OR track_title LIKE "%Inner Fire"
	OR track_title LIKE "%Silly"
	OR track_title LIKE "%Circus"
    
ORDER BY track_title;