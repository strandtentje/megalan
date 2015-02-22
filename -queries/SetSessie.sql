INSERT INTO Sessie(taalcode, cookie) VALUES("en", @sessiekoek);
SELECT LAST_INSERT_ID() sessieid, "en" taalcode;