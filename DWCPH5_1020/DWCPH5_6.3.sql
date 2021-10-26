CREATE TABLE Tanfolyam (
	tkod numeric,
    ar numeric,
    tipus char(30),
    megnevezes char(30),
    primary key(tkod)
);
create table Resztvevo (
	tajszam numeric,
    lakcim char(30),
    nev char(30),
    primary key(tajszam)
);