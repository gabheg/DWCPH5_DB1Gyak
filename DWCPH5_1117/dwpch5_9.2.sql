select avg(ar), min(ar) as min, max(ar) as max
from tanfolyam
inner join befizetes on tanfolyam.tkod=befizetes.kurzus
group by tipus;

select megnevezes, if(ar>100000, "Drága", "Olcsó") as milyen
from tanfolyam;

select t.megnevezes, if(count(r.nev)>10, "Sok", "Kevés") as mennyi
from ((tanfolyam as t
inner join befizetes as b on t.tkod=b.kurzus)
inner join résztvevő as r on b.diak=r.tajszam)
group by t.megnevezes;