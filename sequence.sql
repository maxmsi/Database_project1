--SEKWENCJA do inkrementowania id_log w tabeli table_logs

CREATE SEQUENCE seq_logs_id
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;
