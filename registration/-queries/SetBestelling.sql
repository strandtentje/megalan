/* prevent duplicates */
DELETE FROM Bestelling 
WHERE deelnemer = @deelnemer AND product = @product;
/* actual order */
INSERT INTO Bestelling(deelnemer, product)
VALUES(@deelnemer, @product);