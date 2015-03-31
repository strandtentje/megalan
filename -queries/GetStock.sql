SELECT	
	Vertaling.inhoud full,
	LOWER(Vertaling.klein) chop,
	GREATEST(0, Product.stock - COUNT(AlleBestellingen.id)) count,
	CONCAT(		
		IF (Product.stock < COUNT(AlleBestellingen.id) + 2, "extra ", ""),
		IF (Product.stock < COUNT(AlleBestellingen.id) + 1, "fucking ", ""),
		IF (Product.stock < COUNT(AlleBestellingen.id) + 6, "critical ", ""),
		IF (Product.stock < COUNT(AlleBestellingen.id) + 10, "gently", "")) critical
FROM
	Product
	JOIN
		Vertaling
		ON
			Product.naam = Vertaling.betekenis
	LEFT JOIN
		(SELECT 
			Bestelling.*
		FROM
			Bestelling
			JOIN Deelnemer ON
				Bestelling.deelnemer = Deelnemer.id
		WHERE
			NOT ISNULL(rekening)) AlleBestellingen ON
		Product.id = AlleBestellingen.Product
WHERE
	Vertaling.taalcode = "en" AND 
	Product.categorie = 1
GROUP BY
	Product.id
ORDER BY
	Vertaling.inhoud;