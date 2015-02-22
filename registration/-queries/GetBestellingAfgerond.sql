SELECT
	id deelnemer
FROM
	Deelnemer
WHERE
	id = @deelnemer AND besteld = 1;