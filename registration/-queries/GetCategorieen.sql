SELECT
	ProductCategorie.id categorie,
    Vertaling.inhoud inhoud
FROM
	ProductCategorie
	JOIN
		Vertaling
		ON
			ProductCategorie.naam = Vertaling.betekenis	
WHERE
	Vertaling.taalcode = @taalcode;