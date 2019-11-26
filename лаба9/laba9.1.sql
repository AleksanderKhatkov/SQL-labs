--laba 9

SELECT*FROM CPU
SELECT*FROM HDD;
SELECT*FROM Monitor

--1.Уменьшить стоимость процессоров Celeron фирмы Intel на 5%.
update CPU set price=price*0.95 where model='Celeron' and model='Intel';
--2.Уменьшить стоимость процессоров Duron фирмы AMD на 10%.
update CPU set price=price*0.95 where model='Duron' and model='AMD';
--3.Увеличить стоимость винчестеров фирмы IBM на 5%.
update HDD set price =price*1.05 where firm ='IBM';
--4.Увеличить стоимость мониторов с диагональю равной 17 дюймам на 10%.
update Monitor set price =price*1.15 where diagonal=17;
--5.Удалить из таблицы CPU процессоры, тактовая частота которых меньше 800 Мгц.
delete from computer where CPU in (select code from cpu where frequency < 800);
delete from cpu where frequency<800;
--6.Удалить из таблицы Monitor мониторы, диагональ которых равна 15 дюймов, удалив сначала компьютеры с такими мониторами.
delete from Computer where Monitor in(select code from Monitor where diagonal=15);
delete from Monitor where diagonal=15
