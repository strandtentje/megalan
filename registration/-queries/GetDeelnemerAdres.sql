SELECT
	Deelnemer.adres adres,
	Adres.straat straat,
	Adres.pandnummer pandnummer,
	Adres.postcode postcode,
	Adres.stad stad
FROM
	Deelnemer
	JOIN
		Adres
		ON
			Deelnemer.adres = Adres.id
WHERE
	Deelnemer.id = @deelnemer;