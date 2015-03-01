SELECT	
	Product.id product,
	IF(Product.prijs > -1, 
		CONCAT("| € ", FORMAT(Product.prijs, 2)),
		"") prijs,
    Vertaling.inhoud inhoud,
    Product.minpp minpp,
    Product.maxpp maxpp,
    IF(Product.stock > -1, 
		CONCAT("| ", GREATEST(0, Product.stock - COUNT(AlleBestellingen.id)), " slots left"),
        "") stock
FROM
	Product
	JOIN
		Vertaling
		ON
			Product.naam = Vertaling.betekenis
	LEFT JOIN
		(SELECT
			*
		FROM 
			Bestelling
		WHERE
			deelnemer = @deelnemer) Bestelling
		ON
			Product.id = Bestelling.product
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
	Vertaling.taalcode = @taalcode AND 
	Product.categorie = @categorie AND
	ISNULL(Bestelling.deelnemer)
GROUP BY
	Product.id;