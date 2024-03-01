DELIMITER $$
CREATE TRIGGER aktualizacjaSprzedazy BEFORE UPDATE on sprzedaz 
for EACH ROW 
BEGIN
if (SELECT blokada FROM sprzedaz where id=NEW.id)>0 THEN
SIGNAL SQLSTATE '45000' set message_text='Blad: nie mozna zaktualizowac rekordu';
end IF;
END$$
DELIMITER ;
