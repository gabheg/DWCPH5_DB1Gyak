alter table alkatresz
ADD ár int;

select gyarto.nev
from gyarto
inner join termek on gyarto.adoszam=termek.tkod
where termek.tkod is null;

update termek as t
inner join komponens as k on t.tkod=k.termek
inner join alkatresz as a on k.alkatresz=a.akod
set t.ear=t.ear+(t.ear*1.1)
where a.akod=2;

select termek.nev
from termek
inner join egysegek on termek.tkod=egysegek.aru
where egysegek.db=(select max(db) from egysegek)
