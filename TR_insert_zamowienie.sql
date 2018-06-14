--Log po zlozeniu zamowienia
CREATE OR REPLACE TRIGGER insert_zamowienie
AFTER INSERT ON SPRZEDAZ
REFERENCING NEW AS newROW
FOR EACH ROW
when (newROW.id_ZAMOWIENIA IS NOT NULL)
BEGIN
    insert into logs_table
    VALUES (SEQ_LOGS_ID.NEXTVAL,sysdate,'Sprzedano samochod, id_sprzda¿y : ',:newROW.id_ZAMOWIENIA)
END
go