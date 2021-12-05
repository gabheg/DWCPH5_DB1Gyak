insert into oktató values ('ABC123','Béla Pátfalva','AIF');
insert into oktató values ('ABC234','Anna Mária','GEIK');
insert into oktató values ('ABC345','József Város','AIF');
insert into oktató values ('ABC456','Emma Holló','AIF');
insert into oktató values ('ABC567','Gyula Szalam','GEIK');

insert into tárgy values('abc123', 3, 'angol', 'abc123');
insert into tárgy values('abc234', 5, 'fizika', 'abc234');
insert into tárgy values('abc345', 3, 'német', 'abc123');
insert into tárgy values('abc456', 5, 'oop','abc456');
insert into tárgy values('abc567', 2, 'orosz', 'abc345');

insert into hallgató values('cba123', 'Béla Alma', 'tk123', '1995-04-15',3600, 'Ózd', 1, 'Gyár');
insert into hallgató values('cba234', 'Alap Állás', 'tk234', '1995-06-15',3600, 'Ózd', 2, 'Gyár');
insert into hallgató values('cba345', 'Gábor Áron', 'tk123', '1995-03-15',3600, 'Ózd', 3, 'Gyár');
insert into hallgató values('cba456', 'Zsolt Holló', 'tk234', '1995-02-15',3600, 'Ózd', 4, 'Gyár');
insert into hallgató values('cba567', 'Krisztián Árpa', 'tk234', '1995-07-15',3600, 'Ózd', 5, 'Gyár');	

insert into hallgat values(1,5,'abc123', 'cba123');
insert into hallgat values(2,4,'abc234', 'cba123');
insert into hallgat values(2,3,'abc123', 'cba234');
insert into hallgat values(3,4,'abc456', 'cba456');
insert into hallgat values(4,2,'abc567', 'cba345');

select név from oktató;

select o.név, t.megnevezés
from oktató as o
inner join tárgy as t on o.neptunkód=t.neptunkód;

select o.név, t.megnevezés
from oktató as o
left join tárgy as t on o.neptunkód=t.neptunkód;

select o.név, t.megnevezés
from oktató as o
inner join tárgy as t on o.neptunkód=t.neptunkód
where tanszék like 'Aif';

select avg(kredit) from tárgy;

select count(o.név) as Aif
from oktató as o
inner join tárgy as t on o.neptunkód=t.neptunkód
where tanszék like 'Aif';

select o.név
from oktató as o
left join tárgy as t on o.neptunkód=t.neptunkód
where t.neptunkód is null;

select szül_d from hallgató;

select o.tanszék, count(o.tanszék)
from oktató as o
left join tárgy as t on o.neptunkód=t.neptunkód
group by tanszék;

select t.megnevezés, count(h.neptunkód) as hányhallgató
from tárgy as t
inner join hallgat as h on t.kód=h.kód
group by megnevezés;

select o.név, count(t.neptunkód)
from oktató as o
left join tárgy as t on o.neptunkód=t.neptunkód
where (select count(neptunkód) from tárgy)>2
group by t.neptunkód
limit 1;

select o.név
from oktató as o
left join tárgy as t on o.neptunkód=t.neptunkód
where t.kredit<(select avg(kredit) from tárgy);

select o.név
from oktató as o
left join tárgy as t on o.neptunkód=t.neptunkód
where (select count(neptunkód) from tárgy)>2
group by o.neptunkód
limit 1;

select hallgató.név
from hallgató
inner join hallgat on hallgat.neptunkód=hallgató.neptunkód
inner join tárgy on hallgat.kód=tárgy.kód
where ((select count(hallgat.neptunkód) from hallgat)=(select count(megnevezés) from tárgy))
group by hallgat.neptunkód;
