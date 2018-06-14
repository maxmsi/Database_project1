--Log po zakupie samochodu
CREATE OR REPLACE TRIGGER insert_sprzedaz
AFTER INSERT On SPRZEDAZ
REFERENCING NEW AS newROW
FOR EACH ROW
when (newROW.id_SPRZEDA¯Y IS NOT NULL)
BEGIN
    insert into logs_table
    VALUES (SEQ_LOGS_ID.NEXTVAL,sysdate,'Sprzedano samochod, id_sprzda¿y : ',:newROW.id_SPRZEDA¯Y) 
END

go