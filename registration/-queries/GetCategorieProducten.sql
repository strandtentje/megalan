SELECT	
	Product.id product,
	FORMAT(Product.prijs, 2) prijs,
    Vertaling.inhoud inhoud,
    Product.minpp minpp,
    Product.maxpp maxpp
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
WHERE
	Vertaling.taalcode = @taalcode AND 
	Product.categorie = @categorie AND
	ISNULL(Bestelling.deelnemer);