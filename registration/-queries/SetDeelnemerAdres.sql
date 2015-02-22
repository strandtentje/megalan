INSERT INTO 
	Adres(straat, pandnummer, postcode, stad) 
	VALUES(@straat, @pandnummer, @postcode, @stad);
UPDATE Deelnemer
	SET adres = LAST_INSERT_ID()
WHERE
	id = @deelnemer;