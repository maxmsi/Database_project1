-- Table: Dostawa
CREATE TABLE Dostawa (
    id_dostawy varchar2(25)  NOT NULL,
    ilosc_samochodow integer  NOT NULL,
    Pracownik_id_pracownika varchar2(25)  NOT NULL,
    Fabryka_id_fabryki varchar2(25)  NOT NULL,
    CONSTRAINT Dostawa_pk PRIMARY KEY (id_dostawy)
) ;

-- Table: Fabryka
CREATE TABLE Fabryka (
    id_fabryki varchar2(25)  NOT NULL,
    Marka_id_marki varchar2(25)  NOT NULL,
    CONSTRAINT Fabryka_pk PRIMARY KEY (id_fabryki)
) ;
-- Table: Logs_table
CREATE TABLE Logs_table (
    log_id varchar2(25)  NOT NULL,
    log_date date  NOT NULL,
    acction varchar2(500)  NOT NULL,
id_acction VARCHAR2(25) NOT NULL;
    CONSTRAINT Logs_table_pk PRIMARY KEY (log_id)
) ;

-- Table: Marka
CREATE TABLE Marka (
    id_marki varchar2(25)  NOT NULL,
    nazwa_marki varchar2(30)  NOT NULL,
    CONSTRAINT Marka_pk PRIMARY KEY (id_marki)
) ;
-- Table: Miejsce_Parkingowe
CREATE TABLE Miejsce_Parkingowe (
    id_miejsca int NOT NULL PRIMARY KEY ,
    Przyjecie_id_przyjecia varchar2(25)  NOT NULL
) ;
-- Table: Model
CREATE TABLE Model (
    id_modelu varchar2(25)  NOT NULL,
    nazwa_modelu varchar2(30)  NOT NULL,
    Marka_id_marki varchar2(25)  NOT NULL,
    CONSTRAINT Model_pk PRIMARY KEY (id_modelu)
) ;

-- Table: Pracownik
CREATE TABLE Pracownik (
    id_pracownika varchar2(25)  NOT NULL,
    Imie varchar2(25)  NOT NULL,
    Nazwisko varchar2(25)  NOT NULL,
    adres varchar2(100)  NOT NULL,
    date_zatrudnienia date  NOT NULL,
    numer_telefonu integer  NOT NULL,
    CONSTRAINT Pracownik_pk PRIMARY KEY (id_pracownika)
) ;


-- Table: Przyjecie_samochodu
CREATE TABLE Przyjecie_samochodu (
    id_przyjecia varchar2(25)  NOT NULL,
    Dostawa_id_dostawy varchar2(25)  NOT NULL,
    Samochod_VIN varchar2(17)  NOT NULL,
    CONSTRAINT Przyjecie_samochodu_pk PRIMARY KEY (id_przyjecia)
) ;

-- Table: Samochod
CREATE TABLE Samochod (
    VIN varchar2(17)  NOT NULL,
    Kolor char(15)  NOT NULL,
    Rok_produkcji date  NOT NULL,
    Model_id_modelu varchar2(25)  NOT NULL,
    Marka_id_marki varchar2(25)  NOT NULL,
    CONSTRAINT Samochod_pk PRIMARY KEY (VIN)
) ;
-- Table: Sprzedaz
CREATE TABLE Sprzedaz (
    id_sprzeda¿y varchar2(20)  NOT NULL,
    data_sprzeda¿y varchar2(20)  NOT NULL,
    Zamowienie_id_zamowienia varchar2(20)  NOT NULL,
    Samochod_VIN varchar2(17)  NOT NULL,
    CONSTRAINT Sprzedaz_pk PRIMARY KEY (id_sprzeda¿y)
) ;


-- Table: Zamowienie
CREATE TABLE Zamowienie (
    personalizacja_zamowienia varchar2(255)  NOT NULL,
    id_zamowienia varchar2(20)  NOT NULL,
    Pracownik_id_pracownika varchar2(25)  NOT NULL,
    klient_PESEL integer  NOT NULL,
    CONSTRAINT Zamowienie_pk PRIMARY KEY (id_zamowienia)
) ;

-- Table: klient
CREATE TABLE klient (
    PESEL integer  NOT NULL,
    imie varchar2(255)  NOT NULL,
    naziwsko varchar2(255)  NOT NULL,
    Numer_telefonu integer  NOT NULL,
    CONSTRAINT klient_pk PRIMARY KEY (PESEL)
) ;
---Klucze Obce
-- Reference: Dostawa_Fabryka (table: Dostawa)
ALTER TABLE Dostawa ADD CONSTRAINT Dostawa_Fabryka
    FOREIGN KEY (Fabryka_id_fabryki)
    REFERENCES Fabryka (id_fabryki);

-- Reference: Dostawa_Pracownik (table: Dostawa)
ALTER TABLE Dostawa ADD CONSTRAINT Dostawa_Pracownik
    FOREIGN KEY (Pracownik_id_pracownika)
    REFERENCES Pracownik (id_pracownika);

-- Reference: Fabryka_Marka (table: Fabryka)
ALTER TABLE Fabryka ADD CONSTRAINT Fabryka_Marka
    FOREIGN KEY (Marka_id_marki)
    REFERENCES Marka (id_marki);

-- Reference: Miejsce_Par_Przyjecie_sam (table:Miejsce_Parkingowe)
 ALTER TABLE Miejsce_Parkingowe ADD CONSTRAINT Miejsce_Par_Przyjecie_sam
    FOREIGN KEY (Przyjecie_id_przyjecia)
    REFERENCES Przyjecie_samochodu (id_przyjecia);


-- Reference: Model_Marka (table: Model)
ALTER TABLE Model ADD CONSTRAINT Model_Marka
    FOREIGN KEY (Marka_id_marki)
    REFERENCES Marka (id_marki);

-- Reference: Przyjecie_samochodu_Dostawa (table: Przyjecie_samochodu)
ALTER TABLE Przyjecie_samochodu ADD CONSTRAINT Przyjecie_samochodu_Dostawa
    FOREIGN KEY (Dostawa_id_dostawy)  REFERENCES Dostawa (id_dostawy);

-- Reference: Przyjecie_samochodu_Samochod (table: Przyjecie_samochodu)
ALTER TABLE Przyjecie_samochodu ADD CONSTRAINT Przyjecie_samochodu_Samochod
    FOREIGN KEY (Samochod_VIN)
    REFERENCES Samochod (VIN);

-- Reference: Samochod_Marka (table: Samochod)
ALTER TABLE Samochod ADD CONSTRAINT Samochod_Marka
    FOREIGN KEY (Marka_id_marki)
    REFERENCES Marka (id_marki);

-- Reference: Samochod_Model (table: Samochod)
ALTER TABLE Samochod ADD CONSTRAINT Samochod_Model
    FOREIGN KEY (Model_id_modelu)
    REFERENCES Model (id_modelu);

-- Reference: Sprzedaz_Samochod (table: Sprzedaz)
ALTER TABLE Sprzedaz ADD CONSTRAINT Sprzedaz_Samochod
    FOREIGN KEY (Samochod_VIN)
    REFERENCES Samochod (VIN);

-- Reference: Sprzedaz_Zamowienie (table: Sprzedaz)
ALTER TABLE Sprzedaz ADD CONSTRAINT Sprzedaz_Zamowienie
    FOREIGN KEY (Zamowienie_id_zamowienia)
    REFERENCES Zamowienie (id_zamowienia);

-- Reference: Zamowienie_Pracownik (table: Zamowienie)
ALTER TABLE Zamowienie ADD CONSTRAINT Zamowienie_Pracownik
    FOREIGN KEY (Pracownik_id_pracownika)
    REFERENCES Pracownik (id_pracownika);

-- Reference: Zamowienie_klient (table: Zamowienie)
ALTER TABLE Zamowienie ADD CONSTRAINT Zamowienie_klient
    FOREIGN KEY (klient_PESEL)
    REFERENCES klient (PESEL);
