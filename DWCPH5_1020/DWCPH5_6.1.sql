show databases;
use gyak;
CREATE TABLE GYARTO (
	adoszam int NOT NULL,
    nev char(30) NOT NULL,
    telephely char(30) NOT NULL,
    PRIMARY KEY (adoszam)
    );
CREATE TABLE TERMEK (
	tkod int NOT NULL,
    nev char(50) NOT NULL,
    ear numeric,
    CHECK (ear>0),
    gyarto int NOT NULL,
    foreign key (gyarto) REFERENCES GYARTO(nev)
    )
    