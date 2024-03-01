DELIMITER $$
CREATE TRIGGER aktualizacjaSprzedazy BEFORE UPDATE on sprzedaz 
for EACH ROW 
BEGIN
if (SELECT blokada FROM sprzedaz where id=NEW.id)>0 THEN
SIGNAL SQLSTATE '45000' set message_text='Blad: nie mozna zaktualizowac rekordu';
end IF;
END$$
DELIMITER ;


SELECT * FROM `sprzedaz`

START TRANSACTION;
UPDATE sprzedaz SET cena=300 where id=3;
COMMIT;

SELECT * FROM `sprzedaz`




insert INTO sprzedaz(id_towaru. sztuk, cena, kursantki_id,blokada) VALUES (1,10,100,2,0);
SELECT * FROM sprzedaz;


-- teraz dziala tylko ten z blokada = 0
-- /
START TRANSACTION;
UPDATE sprzedaz SET cena=300 where id=5;
COMMIT;
//



create TABLE zdarzenia(
id_zdarzenia serial,
czas timestamp,
wydarzenia varchar(255),
uzytkownik varchar(120),
tablica varchar(120),
record_id bigint
)engine=INNODB charset=utf8 COLLATE=utf8_polish_ci;

DELIMITER $$
    create trigger logSprzedazy after insert on sprzedaz 
    for each row 
    begin
        insert into zdarzenia(wydarzenia,uzytkownik,tablica,record_id)
        VALUES('insert','trigger','sprzedaz',NEW.id);
    end $$
DELIMITER ;
-- co ten trigger robi? po dodaniu nowego rekordu na tablicy 
-- sprzedaz dodaje do tablicy zdarzenia nowy rekord z nowym id, 
-- wydarzeniem typu 'insert' bo byl insert a nie np update 'trigger' bo to trigger jest wywolywaczem a nie uzytkownik
-- 'sprzedaz' bo bylo to w tablicy sprzedaz "after insert on SPRZEDAZ"


drop trigger if exists nowaSprzedaz;

DELIMITER $$
    create trigger nowaSprzedaz after insert on sprzedaz 
    for each row 
    begin
        update kursantki set ostatni_zakup_id =new.id where kursantki_id=new.kursantki_id;
        insert into zdarzenia(wydarzenia,uzytkownik,tablica,record_id)
        	VALUES('insert','trigger','sprzedaz',NEW.id);
    end $$
DELIMITER ;

insert into sprzedaz (id_towaru, sztuk, cena, kursantki_id, blokada) VALUES(1,555,1010,5,0);