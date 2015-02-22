INSERT INTO 
	Persoon(voornaam, tussenvoegsel, achternaam, email) 
	VALUES(@voornaam, @tussenvoegsel, @achternaam, @email);
UPDATE Deelnemer
	SET persoon = LAST_INSERT_ID()
WHERE
	id = @deelnemer;