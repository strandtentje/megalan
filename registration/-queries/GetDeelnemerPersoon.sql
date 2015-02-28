SELECT
	Deelnemer.persoon persoon,
	Persoon.voornaam voornaam,
	IF(
		LENGTH(TRIM(Persoon.tussenvoegsel)) = 0, 
		' ', 
		CONCAT(' ', Persoon.tussenvoegsel, ' ')
		) tussenvoegsel,
	Persoon.achternaam achternaam,
	Persoon.email email
FROM
	Deelnemer
	JOIN
		Persoon
		ON
			Deelnemer.persoon = Persoon.id
WHERE
	Deelnemer.id = @deelnemer;