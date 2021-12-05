select count(ear) from termek where (ear>(select AVG(ear) from termek));

select nev from termek where(ear=(select max(ear) from termek));

select gyarto.nev
from gyarto
inner join termek on termek.tkod=gyarto.adoszam where(termek.nev=(select nev from termek where(ear=(select max(ear) from termek))));

select avg(termek.ear)
from termek
inner join gyarto on termek.tkod=gyarto.adoszam
GROUP by ear
order by ear desc
limit 1;

select gyarto.nev, avg(termek.ear)
from termek
inner join gyarto on termek.tkod=gyarto.adoszam
GROUP by ear;