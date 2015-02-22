SELECT
	id sessieid,
	taalcode taalcode
FROM
	Sessie
WHERE
	cookie = @sessiekoek;