UPDATE Deelnemer
SET rekening=@rekening, opmerking=@opmerking, sessie=NULL
WHERE id = @deelnemer;