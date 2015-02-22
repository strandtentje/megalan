INSERT INTO Deelnemer(sessie) VALUES(@sessieid);
SELECT LAST_INSERT_ID() deelnemer;