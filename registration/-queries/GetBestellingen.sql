SELECT	
	Bestelling.id bestelling,
	Product.id product,
	FORMAT(Product.prijs, 2) prijs,
    Vertaling.inhoud inhoud
FROM
	Bestelling
	JOIN
		Product
		ON
			Bestelling.product = Product.id
			JOIN
				Vertaling
				ON
					Product.naam = Vertaling.betekenis
WHERE
	Vertaling.taalcode = @taalcode AND 
	Bestelling.deelnemer = @deelnemer;