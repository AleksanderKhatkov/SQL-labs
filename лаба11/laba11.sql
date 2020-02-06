						/*ЛАБА № N11*/

--1.Перечень адресов трёхкомнатных квартир, предлагаемых для продажи в Полоцке.
Select*from Property Where City='Полоцк';
--2.Даты приема на работу сотрудников отделения №4.
Select FName, LName, datetime_Joined, Branch_no from Staff Where Branch_no=4;
3.Перечень объектов собственности, принадлежащих каждому владельцу собственности.
select Owner_no, Property_no From  Property  Order by Owner_no;
--4.Список отделений компании, которые предлагают трехкомнотные квартиры с телефонами.
select distinct(p.Branch_no), b.Btel_no, p.Ptel From Property p JOIN 
 Branch b  on b.Branch_no=p.Branch_no  Where  Rooms=3 and p.Ptel is not null;
--5.Список шифров владельцев собственности (Owner_no), предлагающих несколько трехкомнатных квартир для продажи.
select Owner.Owner_no From Owner Where EXISTS (select Property.Owner_no, Property.Rooms 
From Property Where Owner.Owner_no=Property.Owner_no and Property.Rooms=3) 
select a.Owner_no from (select * from Property where Rooms =3) a group by a.Owner_no having count(a.Property_no) > 1
--6.Вычисления  средней  зарплаты  сотрудников по каждому из отделений компании.
select avg(Salary) salary , Branch.Branch_no from Staff JOIN Branch ON Staff.Branch_no=Branch.Branch_no group by Branch.Branch_no;
select avg(salary) salary ,Branch_no from staff group by Branch_no
--7.Подсчёта количества продаваемых квартир Витебске и Полоцке.
select count(Property_no), city from Property group by City having City = 'Витебске' or City = 'Полоцке'
select count (Property_no) From Property group by City having  City='Витебске' or City = 'Полоцке';
--8.Выведите список и номера телефонов отделений, которые предлагают более одной трехкомнатной квартиры.
SELECT Btel_no, Branch_no from Branch Where Branch_no in (select b.Branch_no from (select Branch_no from Property Where Rooms=3) b
GROUP BY b.Branch_no HAVING COUNT(b.Branch_no) > 1);
/*9.Определите количество объектов, находящихся в введении каждого из сотрудников компании с упорядочением отделений по убыванию.*/
select count(Property_no), Staff_no, Branch_no  from Property  Group By Staff_no, Branch_no order by Branch_no;
/*10.Выведите список сотрудников, за которыми не закреплен ни один из объектов недвижимости.*/
select Staff_no from Staff where Staff_no not in (select distinct(Staff_no) from Property)
/*11.Выведите список трехкомнатных квартир, цена которых превышает среднюю цену трехкомнатной квартиры.*/
select Property_no from Property Where Selling_Price > ( select avg(Selling_Price) from Property Where Rooms=3)
select property_no from Property where Selling_Price > (select avg(selling_price) from Property where Rooms = 3) and rooms = 3
/*12.Выведите список объектов собственности, которые были осмотрены покупателями.*/
select distinct(property_no) from Viewing;
/*13.Найдите всех сотрудников, чья заработная плата выше заработной платы любого из сотрудников отделения компании под номером 3.*/
select Staff_no from Staff Where Salary > (select max(Salary) from Staff Where Branch_no=3)
/*14.Выведите данные об объектах собственности из таблицы PROPERTY только в том случае, если хотя бы один из 
них был осмотрен покупателями и было получено согласие на приобретение. */
select *From Property Where Property_no in (select distinct(property_no) from Viewing)
/*15.Вставьте в таблицу BUYER_2 данные только тех покупателей, которые приобрели объекты собственности. 
Таблица BUYER_2 должна быть заранее создана командой CREATE TABLE.*/
create table Buyer_new (
buyer_no int primary key,
FNAME nvarchar(20),
LNAME nvarchar(20),
City nvarchar(20), 
Street nvarchar(20), 
House nvarchar(20), 
Flat int, 
Htel nvarchar(20),
Wtel nvarchar(20),
Prof_rooms int,
Max_price int, 
Branch_no int);

declare @buyer_no int, @FNAME nvarchar(20), @LNAME nvarchar(20), @City nvarchar(20), @Street nvarchar(20), @House nvarchar(20), @Flat int, 
@Htel nvarchar(20), @Wtel nvarchar(20), @Prof_rooms int, @Max_price int, @Branch_no int

DECLARE cur cursor for select buyer_no, FNAME, LNAME, City, Street, House, Flat, Htel_no, Wtel_no, Prof_rooms, Max_price, Branch_no from Buyer

open cur

fetch next from cur into @buyer_no ,@FNAME, @LNAME, @City, @Street, @House, @Flat, @Htel, @Wtel, @Prof_rooms, @Max_price, @Branch_no

WHILE @@FETCH_STATUS = 0
BEGIN 
    insert into Buyer_new (buyer_no,FNAME,LNAME, City, Street, House, Flat, Htel, Wtel,Prof_rooms,Max_price, Branch_no) 
	values(@buyer_no,@FNAME, @LNAME, @City, @Street, @House, @Flat, @Htel, @Wtel, @Prof_rooms, @Max_price, @Branch_no)
    fetch next from cur into @buyer_no ,@FNAME, @LNAME, @City, @Street, @House, @Flat, @Htel, @Wtel, @Prof_rooms, @Max_price, @Branch_no
END

CLOSE cur
DEALLOCATE cur

drop table Buyer_new
select*from  Buyer_new

/*16.Снизить цену в 2 раза на те объекты собственности, у которых поле Comments таблицы VIEWING содержит значение 'требует ремонта'.*/
update property set Selling_Price = Selling_Price/2 where Property_no in (select Property_no from Viewing where Comments = 'требует ремонта')
/*17.Создать сгруппированный по отделениям и упорядоченный по алфавиту список сотрудников, поступивших на работу более трех лет назад.*/
select*from (select * from Staff where DATEDIFF(year,datetime_Joined,getdate()) > 3) a order by a.Branch_no, a.LName;
/*18.Найти среднюю заработную плату сотрудников в каждом из отделений.*/
select  avg(Salary), Branch_no from Staff  group by Branch_no;
/*19.Список трехкомнатных квартир площадью не менее 60 метров, расположенных на втором - четвертом этажах, цена которых не превышает 10000$.*/
select *  from Property where Floor >= 2 and Floor <= 4 and Selling_Price <= 10000 and Rooms = 2 and 
convert(float,substring(The_area,1,2))+convert(float,substring(The_area,4,2))+convert(float,substring(The_area,7,1))
+(convert(float,substring(The_area,9,1))/10) > 60;
/*20.Найти среднюю цену трехкомнатных квартир с балконами.*/
select avg(Selling_Price) from Property where Rooms = 3 and Balcony ='Á';
select avg(selling_price) from property where Rooms = 3 and Balcony is not null
/*21.Найти самую дешевую однокомнатную квартиру*/
select * from property where rooms = 1 and Selling_Price <= (select avg(selling_price) from Property where Rooms = 1)
/*22.Вывести список квартир (адреса), осмотренных покупателями, у которых в поле Comment занесено значение 'требует ремонта'.*/
select City, Street, House,Flat from Property where Property_no in (select Property_no from Viewing where Comments = 'требует ремонта')
/*23.Количество однокомнатных квартир, цены которых не превышают средней цены однокомнатной квартиры.*/
select count(Property_no) from Property where rooms = 1 and Selling_Price <=(select avg(Selling_Price) from  Property where Rooms = 1)
/*24.Перечень квартир, проданных каждым агентом за декабрь 2019г. (квартира считается проданной.*/
select Property_no from Contract where month(datetime_Contract) = 12 and year(datetime_Contract) = 2019
/*25.Список сотрудников фирмы, продавших хотя бы одну квартиру за декабрь 2019г.*/
select a.Staff_no from (select c.Property_no, p.Staff_no from Contract c join Property p on p.Property_no = c.Property_no
where month(datetime_Contract) = 12 and year(datetime_Contract) = 2019) a group by a.Staff_no having count(property_no) > 0
/*26.Найти все трехкомнатные квартиры в Витебске, цены которых выше цены любой трехкомнатной квартиры в Полоцке.*/
select property_no from property where City = 'Витебске' and Selling_Price > (select max(selling_price) from Property where City ='Полоцке')

/*27.Процедура: для владельца квартиры (параметр)  
вывести список возможных покупателей и номера их телефонов.*/
DROP PROCEDURE Proce_Owner
GO
CREATE PROCEDURE Proce_Owner AS
BEGIN
	select Buyer_no, Htel_no from Buyer Where EXISTS(select * from Contract Where  Buyer.Buyer_no=Contract.Buyer_no )
END

EXEC Proce_Owner;

/*28.Повысить на 20% зарплату агентов, продавших не менее одной квартиры за декабрь 2019г.*/
update staff set Salary = Salary *1.2 where Staff_no in (select distinct(Staff_no) 
from Property p join Contract c on c.Property_no = p.Property_no where month(datetime_Contract) = 12 and year(datetime_Contract) = 2019)

/*29.С помощью команды UPDATE уменьшить цены однокомнатных квартир, которые не были проданы в течение года с момента регистрации, на 5%.*/
update Property set Selling_Price = Selling_Price * 0.95 where rooms = 1 and 
Property_no in (select Property_no from Property 
where datediff(year,datetime_registration,GETDATE()) > 0 or (month(datetime_registration) < month(getdate()) and datediff(year,datetime_registration,GETDATE()) = 1))

/*30.Создать представление, позволяющее руководителю отделения компании под номером 3 иметь доступ только к данным сотрудни¬ков своего отделения.*/
CREATE VIEW Branch_B AS
SELECT * from Branch Where Branch_no=3;
select*from  Branch_B

/*31.Создайте представление, содержащее данные об агентах, отвечающих за продажу объектов.
Представление должно включать номер отделения (Branch_no), номер работника (Staff_no) 
и сведения о количестве объектов, за которые он отвечает.*/
drop view Staff_new
create view Staff_new AS 
select branch_no, Staff_no, count(Property_no) property_count from Property group by Branch_no, Staff_no
select*from Staff_new;
/*32.Создайте представление, содержащее данные о количестве квартир, 
принадлежащих каждому из владельцев собственности. 
Представление должно включать номер владельца, его данные и количество принадлежащих ему объектов.*/
drop view Proprty_new
create view Proprty_new AS
select a.*, b.property_count from Owner a 
join (select owner_no, count(property_no) property_count from property group by Owner_no) b on a.Owner_no = b.Owner_no
select*from Proprty_new;
/*33.Cоздайте представление, содержащее следующую информацию о сотрудниках компании:
номер, имя и фамилию, адрес и номер телефона.*/
drop view Staff_n
create view Staff_n AS
select Staff_no, Fname, LName, Street, Stel_no from Staff;
select*from Staff_n

create view staff2 as 
select Staff_no, FName, LName, Street + ' ' + cast(House as varchar(6)) + ' ' + cast(Flat as varchar(6)) adress, Stel_no from staff
select*from staff2
/*34.Создайте процедуру для вывода окладов сотрудников заданного как параметр отделения.*/
create procedure staff_salary
	@branch_no int
as
select branch_no, staff_no, salary from Staff where Branch_no = @Branch_no
exec staff_salary 3

/*35.Cоздайте процедуру для вывода списка владельцев собственности, 
чьи объекты были осмотрены в определенный день(параметр процедуры).*/
create procedure show_views
	@view_date datetime
	as
select distinct(owner_no) from property where Property_no in 
(select property_no from Viewing where datetime_View like @view_date + '%')

/*36.Создайте хранимую процедуру для индексации цен объектов собственности (увеличьте цену на заданный процент).*/
create procedure price_update
	@indexation float
as
update Property set Selling_Price = Selling_Price * (1 + (@indexation / 100))

exec price_update 1.1

/*37.Создайте хранимую процедуру для подсчета количества объектов, 
проданных определенным сотрудником (в процедуру передается номер сотрудника).*/
create procedure count_sells
	@staff_no nvarchar(9)
as 
select count(c.property_no) selled_property_count 
from (select property_no, staff_no from property where Property_no in (select property_no from Contract)) 
c group by c.Staff_no having c.Staff_no = @staff_no

/*38.Создать процедуру для повышения заработной платы сотрудника только в том случае, если за ним закреплен хотя бы один объект 
собственности в таблице Property (номер сотрудника и процент повышения заработной платы передаются в процедуру как параметры). */
create procedure sallary_update
	@staff_no nvarchar(9),
	@indexation float
as 
update Staff set Salary = Salary * (1 + (@indexation / 100)) where Staff_no = @staff_no and Staff_no in (select staff_no from Property)

/*39.Создайте триггер для увеличения зарплаты сотрудника на 1% при каждой продаже.*/
create trigger done_selling
on contract
after insert
as
update Staff
set Salary = Salary * 1.01 where Staff_no in (select Staff_no from property where Property_no in (select property_no from inserted))

/*40.Создайте триггер для удаления из таблицы PROPERTY объектов собственности, 
принадлежащих владельцу, данные о котором удаляются из таблицы OWNER. Предварительно удалить ограничение.*/
create trigger property_dell
on owner
after delete
as
delete from Property where Owner_no in (select Owner_no from deleted)

/*41.Создайте триггер для проверки наличия номера отделения Branch_no в таблице BRANCH при вводе этого номера в таблицу BUYER (при вставке новой строки)
и запрета вставки записи при нарушении ссылоч¬ной целостности. Предварительно удалить ограничение.*/
create trigger check_insert
on buyer
instead of insert
as
if ((select branch_no from inserted) in (select branch_no from Branch)) select 'DATA INTEGRITY WAS BROKE'

/*42.Создайте триггер для снижения стоимости квартиры, если в поле Comments таблицы VIEWING вводится значение «требует ремонта».*/
create trigger property_price_d
on viewing
after insert
as
if ((select Comments from inserted) = 'требует ремонта')
	update Property set Selling_Price = 0.9 * Selling_Price where Property_no in (select Property_no from inserted)


select*from Branch;
select*from Owner;
select*from Buyer;
select*from Staff;
select*from Property;
select*from Viewing;
select*from Contract;


