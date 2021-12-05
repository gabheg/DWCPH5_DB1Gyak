create table egysegek (
aru int,
db int check (db>0),
FOREIGN KEY(aru) REFERENCES termek(tkod)
);

insert into egysegek values (1, 5);
insert into egysegek values (2, 15);
insert into egysegek values (3, 35);
insert into egysegek values (4, 105);
insert into egysegek values (5, 1);

create table alkatresz (
akod int,
nev char(50),
PRIMARY KEY(akod)
);

insert into alkatresz values (1, 'húr');
insert into alkatresz values (2, 'bőr');
insert into alkatresz values (3, 'dallam');
insert into alkatresz values (4, 'por');
insert into alkatresz values (5, NULL);

create table komponens (
termek int,
alkatresz int,
FOREIGN KEY(termek) REFERENCES termek(tkod),
FOREIGN KEY(alkatresz) REFERENCES alkatresz(akod)
);

insert into komponens values(1,1);
insert into komponens values(2,2);
insert into komponens values(3,3);
insert into komponens values(4,4);
insert into komponens values(5,5);

select termek.nev, gyarto.nev
from termek
INNER JOIN gyarto ON termek.tkod = gyarto.adoszam;
select termek.nev, termek.ear
from termek
INNER JOIN gyarto ON termek.tkod = gyarto.adoszam where (gyarto.nev like 'Albert Holl');

select a.nev from ((alkatresz a
inner join komponens k on a.akod=k.alkatresz)
inner join termek t on k.termek=t.tkod) where t.nev='labda';

select t.nev from ((termek t
inner join komponens k on t.tkod=k.termek)
inner join alkatresz a on k.alkatresz=a.akod) where a.nev is null;

