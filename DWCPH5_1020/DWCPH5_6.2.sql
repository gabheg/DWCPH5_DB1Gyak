show databases;
use gyak;
CREATE TABLE GYARTO (
	adoszam int NOT NULL,
    nev char(30) NOT NULL,
    telephely char(30) NOT NULL,
	irsz char(4),
    varos char(40),
    utca char(100),
    PRIMARY KEY (adoszam)
    );
CREATE TABLE TERMEK (
	tkod int NOT NULL,
    nev char(50) NOT NULL,
    ear numeric,
    CHECK (ear>0),
    gyarto int NOT NULL,
    foreign key (gyarto) REFERENCES GYARTO(nev)
    );
CREATE TABLE Alkatresz(
	akod numeric,
    nev char(50),
    primary key (akod)
);
CREATE TABLE komponens (
	termek numeric,
    alkatresz numeric,
    foreign key (termek) references termek(nev),
    foreign key (alkatresz) references alkatresz(akod)
);
CREATE TABLE egysegek (
	aru numeric,
    db numeric,
    check (db>0),
    foreign key (aru) references termek(nev)
);
    