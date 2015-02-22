SELECT	
	Bestelling.id bestelling,
	Product.id product,
	FORMAT(Product.prijs, 2) prijs,
    Vertaling.inhoud inhoud,
    CategorieVertaling.inhoud categorienaam
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
			JOIN
				ProductCategorie
				ON
					Product.categorie = ProductCategorie.id
					JOIN
						Vertaling CategorieVertaling
						ON
							ProductCategorie.naam = CategorieVertaling.betekenis
WHERE
	Vertaling.taalcode = @taalcode AND 
	CategorieVertaling.taalcode = @taalcode AND
	Bestelling.deelnemer = @deelnemer;