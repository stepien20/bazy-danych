CREATE TABLE `klienci`(
`id_klienta` int AUTO_INCREMENT PRIMARY KEY,
`miasto` varchar(120) not null,
`adres` varchar(120) not null,
`nazwa` varchar(120) not null  
)engine=INNODB DEFAULT charset=utf8 COLLATE=utf8_polish_ci;

create TABLE `dostawcy`(
`id_dostawcy` INT AUTO_INCREMENT PRIMARY KEY,
`nazwa` enum("Pocztex","InPost","GLS"),
`koszt_dostawy` float(2,2) not null)engine=INNODB DEFAULT charset=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE `zamowienia`(
`id_zamowienia` INt AUTO_INCREMENT PRIMARY KEY,
`data_zalozenia` date not null,
`id_klienta` int not null,
`id_dostawcy` int not null,
 FOREIGN KEY(id_dostawcy) REFERENCES dostawcy(id_dostawcy),
  FOREIGN KEY(id_klienta) REFERENCES klienci(id_klienta)
)engine=INNODB DEFAULT charset=utf8 COLLATE=utf8_polish_ci;


create TABLE `kategorie`(
`id_kategorii` INT PRIMARY KEY AUTO_INCREMENT,
`nazwa_kategorii` varchar(120)
)engine=INNODB DEFAULT charset=utf8 COLLATE=utf8_polish_ci;

create TABLE `towary`(
`id_towaru` int AUTO_INCREMENT PRIMARY KEY,
`id_kategorii` INT not null,
`nazwa` varchar(120) not null,
`cena` float(5,2) not null,
FOREIGN KEY (id_kategorii) REFERENCES kategorie(id_kategorii)
)engine=INNODB DEFAULT charset=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE `szczegoly_zamowienia`(
`id_zamowienia` INt not null,
`id_towaru` int not null,
`ilosc` int DEFAULT 1 not null,
 FOREIGN KEY(id_zamowienia) REFERENCES zamowienia(id_zamowienia),
  FOREIGN KEY(id_towaru) REFERENCES towary(id_towaru) 
)engine=INNODB DEFAULT charset=utf8 COLLATE=utf8_polish_ci;