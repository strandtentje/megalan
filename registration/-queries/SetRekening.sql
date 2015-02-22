INSERT INTO Rekening(tnv, nummer, plaats)
VALUES (@tnv, @nummer, @plaats);
SELECT LAST_INSERT_ID() rekening;