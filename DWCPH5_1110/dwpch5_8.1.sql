create table GYARTO (
    adoszam int NOT NULL,
    nev varchar(30),
    telephely varchar(30),
    irsz varchar(4),
    varos varchar(40),
    utca varchar(100),
    PRIMARY KEY (adoszam)
);

create table TERMEK (
    tkod int NOT NULL,
    nev varchar(50),
    ear INT,
    CHECK (ear>0),
    gyarto int NOT NULL,
    PRIMARY KEY (tkod),
    FOREIGN KEY (gyarto) REFERENCES GYARTO(adoszam)
);

insert into gyarto values (1, 'Bob Builder', 'bolt', '3600', 'Ózd', 'Gyár');
insert into gyarto values (2, 'Karl Rot', 'szalon', '3600', 'Ózd', 'Vasvár út');
insert into gyarto values (3, 'Anna Marie', 'stúdió', '3600', 'Ózd', 'Március 15.');
insert into gyarto values (4, 'Albert Holl', 'garázs', '3600', 'Ózd', 'Ív út');
insert into gyarto values (5, 'Emma Chamberlain', 'tó', '3600', 'Ózd', 'Bolyok');

insert into termek values (1, 'Ütő', 15, 1);
insert into termek values (2, 'Labda', 5, 2);
insert into termek values (4, 'Festék', 2, 3);
insert into termek values (5, 'Alma', 100, 4);
insert into termek values (3, 'Dal', 1, 5);

select * from termek where (ear>2);
select * from gyarto where (telephely like 'bolt');
select count(tkod)
from termek where(ear>2);
select tkod from termek where (nev like '%tej%');
select nev from gyarto where(telephely is null);