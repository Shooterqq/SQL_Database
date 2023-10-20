CREATE DATABASE skbdX CHARSET utf8 COLLATE utf8_polish_ci;
USE skbdX;
CREATE TABLE kategoria
	(
		 id_kategoria INT PRIMARY KEY
		,nazwa NVARCHAR(46)
	);
	
CREATE TABLE autor
	(
		 id_autor INT  PRIMARY KEY
		,imie NVARCHAR(15)
		,nazwisko NVARCHAR(30)
	);	
	
CREATE TABLE wydawnictwo
	(
		 id_wydawnictwo INT  PRIMARY KEY
		,nazwa NVARCHAR(30)
	);		

CREATE TABLE ksiazka
	(
		 id_ksiazka INT PRIMARY KEY
		,isbn NVARCHAR(13)
		,id_kategoria INT
		,FOREIGN KEY (id_kategoria) REFERENCES kategoria(id_kategoria)
		,tytul NVARCHAR(255)
		,opis NVARCHAR(1000)
    		,id_autor INT
		,FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
		,id_wydawnictwo INT
		,FOREIGN KEY (id_wydawnictwo) REFERENCES wydawnictwo(id_wydawnictwo)
		,rok_wydania INT
	);	

CREATE TABLE czytelnik
	(
		 id_czytelnik INT PRIMARY KEY
		,login NVARCHAR(10)
		,haslo NVARCHAR(20)
		,email NVARCHAR(30)
		,telefon NVARCHAR(20)
		,data_urodzenia DATE
	);
	
CREATE TABLE rola
    (
		 id_rola INT PRIMARY KEY
		,nazwa NVARCHAR(25)
	);
	
CREATE TABLE pracownik
    (
		 id_pracownik INT PRIMARY KEY
		,login NVARCHAR(10)
		,haslo NVARCHAR(20)
		,id_rola INT
		,FOREIGN KEY (id_rola) REFERENCES rola(id_rola)
	);	
	
CREATE TABLE wypozyczenie
	(
		 id_wypozyczenie BIGINT PRIMARY KEY
		,id_czytelnik INT
		,FOREIGN KEY (id_czytelnik) REFERENCES czytelnik(id_czytelnik)
		,id_ksiazka INT
		,FOREIGN KEY (id_ksiazka) REFERENCES ksiazka(id_ksiazka)
		,data_wypozyczenia DATE
		,id_pracownik_wypozyczenie INT
		,FOREIGN KEY (id_pracownik_wypozyczenie) REFERENCES pracownik(id_pracownik)
		,data_oddania DATE
		,id_pracownik_oddanie INT
		,FOREIGN KEY (id_pracownik_oddanie) REFERENCES pracownik(id_pracownik)
	);
