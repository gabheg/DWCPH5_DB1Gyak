create table tanfolyam (
tkod int,
ar int check(ar>0),
megnevezes char(50),
tipus char(1),
primary key(tkod)
);

create table résztvevő (
tajszam char(12),
nev char(50),
lakcim char(100),
primary key(tajszam)
);

create table befizetes (
kurzus int,
diak char(12),
befizetes int,
foreign key(kurzus) references tanfolyam(tkod),
foreign key(diak) references résztvevő(tajszam)
);

insert into tanfolyam values (1, 1000, 'Kőműves', 'a');
insert into tanfolyam values (2, 2000, 'ács', 'b');
insert into tanfolyam values (3, 3000, 'kovács', 'a');
insert into tanfolyam values (4, 1000, 'kádár', 'c');
insert into tanfolyam values (5, 4000, 'vasszerelő', 'd');

insert into résztvevő values ('12345a', 'Bob Builder', 'aa bb cc');
insert into résztvevő values ('12345b', 'Hoiler Ottó', 'bb aa cc');
insert into résztvevő values ('12345c', 'Kiss Alma', 'cc bb cc');
insert into résztvevő values ('12345d', 'Kettes Létra', 'dd bb cc');
insert into résztvevő values ('12345e', 'Frank Ribery', 'ee bb cc');

insert into befizetes values (1, '12345a', 1000);
insert into befizetes values (2, '12345b', 2000);
insert into befizetes values (3, '12345c', 3000);
insert into befizetes values (4, '12345d', 1000);
insert into befizetes values (5, '12345e', 4000);

select tipus, count(tipus)
from tanfolyam
group by tipus;

select tanfolyam.megnevezes, tanfolyam.tkod, count(befizetes.befizetes)
from tanfolyam
inner join befizetes on tanfolyam.tkod=befizetes.kurzus
group by tanfolyam.megnevezes;

select count(befizetes.befizetes)
from befizetes
inner join tanfolyam on befizetes.kurzus=tanfolyam.tkod where befizetes.befizetes>=tanfolyam.ar;

select résztvevő.lakcim, count(befizetes.befizetes)
from ((befizetes
inner join tanfolyam on befizetes.kurzus=tanfolyam.tkod)
inner join résztvevő on befizetes.diak=résztvevő.tajszam)
group by résztvevő.lakcim;
