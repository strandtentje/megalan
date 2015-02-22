SELECT
	Deelnemer.persoon persoon,
	Persoon.voornaam voornaam,
	Persoon.tussenvoegsel tussenvoegsel,
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