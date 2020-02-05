/*Лабораторная работа №8*/

/*1.Для каждого изделия  выдать номер изделия и соответствующее общее количество деталей.*/
select detail_id, sum(quantity) quantity from SPJ group by detail_id
/*2.Получить номера изделий, для которых детали  поставляет поставщик S1.*/
select distinct(detail_id) from spj where dealer_id = 'S1'
/*3.Получить номера и фамилии поставщиков, поставляющих детали для какого-либо изделия с деталью P1 в количестве, большем, чем средний объем поставок детали P1 для этого изделия.*/
select dealer_id, last_name from s where dealer_id in (select dealer_id from spj where product_id in (select product_id from spj where detail_id = 'P1' and quantity > (select avg(quantity) from spj group by detail_id having detail_id = 'P1')))
/*4.Выдать общее количество деталей P1, поставляемых поставщиком S1.*/
select sum(quantity) quantity from spj group by detail_id, dealer_id having detail_id = 'P1' and dealer_id = 'S1'
/*5.Получить номера деталей, поставляемых каким-либо поставщиком из Лондона, для изделия, изготавливаемого также в Лондоне*/
select detail_id from spj where dealer_id in (select dealer_id from s where city = 'Лондон') and product_id in (select product_id from j where city = 'Лондон')
/*6.Выдать номера и фамилии поставщиков, поставляющих одну и ту же деталь для всех изделий.*/
select dealer_id, last_name from s where dealer_id in (select dealer_id from spj group by dealer_id having count(distinct(detail_id)) = 1)
/*7.Получить общее число изделий, для которых поставляет детали поставщик S1.*/
select count(product_id) product_count from spj where dealer_id = 'S1'
/*8.Выдать номера изделий, детали для которых поставляет каждый поставщик, поставляющий  какую-либо красную деталь*/
select distinct(product_id) from spj where dealer_id in (select dealer_id where detail_id in (select detail_id from p where color = 'E?aniue'))
/*9.Получить список всех поставок, в которых количество деталей находится в диапазоне от 300 до 750 включительно.*/
select * from spj where quantity >= 300 and quantity <= 750
/*10.Увеличить на 10 рейтинг всех поставщиков, рейтинг которых в настоящее время меньше, чем рейтинг поставщика S4.*/
update s set raiting = raiting + 10 where raiting < (select raiting from s where dealer_id = 'S4')
select * from s
/*11.Построить таблицу с комбинациями "цвет детали - город, где хранится деталь", исключая дубликаты пар (цвет-город).*/
select distinct(color), city from p
/*12.Вставить в таблицу S нового поставщика с номером S10 с фамилией Уайт из города Нью-Йорк с неизвестным рейтингом*/
insert s(dealer_id, last_name, city) values ('S10', 'Уайт', 'Нью-Йорк')
select * from s
/*13.Удалить все изделия из Рима и все соответствующие поставки.*/
delete from spj where product_id in (select product_id from j where city ='Рима')
delete from j where city ='Рима'
/*14.Построить таблицу с упорядоченным списком всех городов, в которых размещаются по крайней мере один поставщик, деталь или изделие.*/
select distinct(s1.city) from (select city from s union all select city from p union all select city from j) s1
/*15.Изменить цвет красных деталей с весом менее 15 фунтов на желтый.*/
update p set color = 'красны' where mass < 15 and color = 'желтый' 
select * from p
/*16.Построить таблицу с номерами изделий и городов, где они изготавливаются, такие, что второй буквой названия города является "О".*/
select product_id, city from j where city like '_o%'




