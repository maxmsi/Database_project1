create or REPLACE VIEW sold_cars
as
select data_sprzeda¿y, kolor, nazwa_modelu, nazwa_marki,pesel AS Pesel_Klienta

from sprzedaz sp
join samochod sa
on sp.samochod_VIN=sa.VIN
join Model m
on sa.MODEL_ID_MODELU=m.id_modelu
join Marka ma
on ma.id_marki=sa.marka_id_marki
join zamowienie zam
on sp.zamowienie_id_zamowienia=zam.ID_ZAMOWIENIA
join klient k
on zam.klient_PESEL=k.PESEL;