											/*������������ ������ N11*/

--1.�������� ������� ������������ �������, ������������ ��� ������� � �������.
Select*from Property Where City='������';
--2.���� ������ �� ������ ����������� ��������� �4.
Select FName, LName, datetime_Joined, Branch_no from Staff Where Branch_no=4;
--3.�������� �������� �������������, ������������� ������� ��������� �������������.
select Owner_no, Property_no From  Property  Order by Owner_no;
--4.������ ��������� ��������, ������� ���������� ������������� �������� � ����������.
select distinct(p.Branch_no), b.Btel_no, p.Ptel From Property p JOIN 
 Branch b  on b.Branch_no=p.Branch_no  Where  Rooms=3 and p.Ptel is not null;
--5.������ ������ ���������� ������������� (Owner_no), ������������ ��������� ������������� ������� ��� �������.
select Owner.Owner_no From Owner Where EXISTS (select Property.Owner_no, Property.Rooms 
From Property Where Owner.Owner_no=Property.Owner_no and Property.Rooms=3) 
select a.Owner_no from (select * from Property where Rooms =3) a group by a.Owner_no having count(a.Property_no) > 1
--6.����������  �������  ��������  ����������� �� ������� �� ��������� ��������.
select avg(Salary) salary , Branch.Branch_no from Staff JOIN Branch ON Staff.Branch_no=Branch.Branch_no group by Branch.Branch_no;
select avg(salary) salary ,Branch_no from staff group by Branch_no
--7.�������� ���������� ����������� ������� �������� � �������.
select count(Property_no), city from Property group by City having City = '�������' or City = '������'
select count (Property_no) From Property group by City having  City='�������' or City = '������';
--8.�������� ������ � ������ ��������� ���������, ������� ���������� ����� ����� ������������� ��������.
SELECT Btel_no, Branch_no from Branch Where Branch_no in (select b.Branch_no from (select Branch_no from Property Where Rooms=3) b
GROUP BY b.Branch_no HAVING COUNT(b.Branch_no) > 1);
/*9.���������� ���������� ��������, ����������� � �������� ������� �� ����������� �������� � ������������� ��������� �� ��������.*/
select count(Property_no), Staff_no, Branch_no  from Property  Group By Staff_no, Branch_no order by Branch_no;
/*10.�������� ������ �����������, �� �������� �� ��������� �� ���� �� �������� ������������.*/
select Staff_no from Staff where Staff_no not in (select distinct(Staff_no) from Property)
/*11.�������� ������ ������������� �������, ���� ������� ��������� ������� ���� ������������� ��������.*/
select Property_no from Property Where Selling_Price > ( select avg(Selling_Price) from Property Where Rooms=3)
select property_no from Property where Selling_Price > (select avg(selling_price) from Property where Rooms = 3) and rooms = 3
/*12.�������� ������ �������� �������������, ������� ���� ��������� ������������.*/
select distinct(property_no) from Viewing;
/*13.������� ���� �����������, ��� ���������� ����� ���� ���������� ����� ������ �� ����������� ��������� �������� ��� ������� 3.*/
select Staff_no from Staff Where Salary > (select max(Salary) from Staff Where Branch_no=3)
/*14.�������� ������ �� �������� ������������� �� ������� PROPERTY ������ � ��� ������, ���� ���� �� ���� �� 
��� ��� �������� ������������ � ���� �������� �������� �� ������������. */
select *From Property Where Property_no in (select distinct(property_no) from Viewing)
/*15.�������� � ������� BUYER_2 ������ ������ ��� �����������, ������� ��������� ������� �������������. 
������� BUYER_2 ������ ���� ������� ������� �������� CREATE TABLE.*/
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

/*16.������� ���� � 2 ���� �� �� ������� �������������, � ������� ���� Comments ������� VIEWING �������� �������� '������� �������'.*/
update property set Selling_Price = Selling_Price/2 where Property_no in (select Property_no from Viewing where Comments = '������� �������')
/*17.������� ��������������� �� ���������� � ������������� �� �������� ������ �����������, ����������� �� ������ ����� ���� ��� �����.*/
select*from (select * from Staff where DATEDIFF(year,datetime_Joined,getdate()) > 3) a order by a.Branch_no, a.LName;
/*18.����� ������� ���������� ����� ����������� � ������ �� ���������.*/
select  avg(Salary), Branch_no from Staff  group by Branch_no;
/*19.������ ������������� ������� �������� �� ����� 60 ������, ������������� �� ������ - ��������� ������, ���� ������� �� ��������� 10000$.*/
select *  from Property where Floor >= 2 and Floor <= 4 and Selling_Price <= 10000 and Rooms = 2 and 
convert(float,substring(The_area,1,2))+convert(float,substring(The_area,4,2))+convert(float,substring(The_area,7,1))
+(convert(float,substring(The_area,9,1))/10) > 60;
/*20.����� ������� ���� ������������� ������� � ���������.*/
select avg(Selling_Price) from Property where Rooms = 3 and Balcony ='�';
select avg(selling_price) from property where Rooms = 3 and Balcony is not null
/*21.����� ����� ������� ������������� ��������*/
select * from property where rooms = 1 and Selling_Price <= (select avg(selling_price) from Property where Rooms = 1)
/*22.������� ������ ������� (������), ����������� ������������, � ������� � ���� Comment �������� �������� '������� �������'.*/
select City, Street, House,Flat from Property where Property_no in (select Property_no from Viewing where Comments = '������� �������')
/*23.���������� ������������� �������, ���� ������� �� ��������� ������� ���� ������������� ��������.*/
select count(Property_no) from Property where rooms = 1 and Selling_Price <=(select avg(Selling_Price) from  Property where Rooms = 1)
/*24.�������� �������, ��������� ������ ������� �� ������� 2019�. (�������� ��������� ���������.*/
select Property_no from Contract where month(datetime_Contract) = 12 and year(datetime_Contract) = 2019
/*25.������ ����������� �����, ��������� ���� �� ���� �������� �� ������� 2019�.*/
select a.Staff_no from (select c.Property_no, p.Staff_no from Contract c join Property p on p.Property_no = c.Property_no
where month(datetime_Contract) = 12 and year(datetime_Contract) = 2019) a group by a.Staff_no having count(property_no) > 0
/*26.����� ��� ������������� �������� � ��������, ���� ������� ���� ���� ����� ������������� �������� � �������.*/
select property_no from property where City = '�������' and Selling_Price > (select max(selling_price) from Property where City ='������')

/*27.���������: ��� ��������� �������� (��������)  
������� ������ ��������� ����������� � ������ �� ���������.!!!!!*/
DROP PROCEDURE Proce_Owner
GO
CREATE PROCEDURE Proce_Owner AS
BEGIN
	select Buyer_no, Htel_no from Buyer Where EXISTS(select * from Contract Where  Buyer.Buyer_no=Contract.Buyer_no )
END

EXEC Proce_Owner;

/*28.�������� �� 20% �������� �������, ��������� �� ����� ����� �������� �� ������� 2019�.*/
update staff set Salary = Salary *1.2 where Staff_no in (select distinct(Staff_no) 
from Property p join Contract c on c.Property_no = p.Property_no where month(datetime_Contract) = 12 and year(datetime_Contract) = 2019)

/*29.� ������� ������� UPDATE ��������� ���� ������������� �������, ������� �� ���� ������� � ������� ���� � ������� �����������, �� 5%.*/
update Property set Selling_Price = Selling_Price * 0.95 where rooms = 1 and 
Property_no in (select Property_no from Property 
where datediff(year,datetime_registration,GETDATE()) > 0 or (month(datetime_registration) < month(getdate()) and datediff(year,datetime_registration,GETDATE()) = 1))

/*30.������� �������������, ����������� ������������ ��������� �������� ��� ������� 3 ����� ������ ������ � ������ ����������� ������ ���������.*/
CREATE VIEW Branch_B AS
SELECT * from Branch Where Branch_no=3;
select*from  Branch_B

/*31.�������� �������������, ���������� ������ �� �������, ���������� �� ������� ��������.
������������� ������ �������� ����� ��������� (Branch_no), ����� ��������� (Staff_no) 
� �������� � ���������� ��������, �� ������� �� ��������.*/
drop view Staff_new
create view Staff_new AS 
select branch_no, Staff_no, count(Property_no) property_count from Property group by Branch_no, Staff_no
select*from Staff_new;
/*32.�������� �������������, ���������� ������ � ���������� �������, 
������������� ������� �� ���������� �������������. 
������������� ������ �������� ����� ���������, ��� ������ � ���������� ������������� ��� ��������.*/
drop view Proprty_new
create view Proprty_new AS
select a.*, b.property_count from Owner a 
join (select owner_no, count(property_no) property_count from property group by Owner_no) b on a.Owner_no = b.Owner_no
select*from Proprty_new;
/*33.C������� �������������, ���������� ��������� ���������� � ����������� ��������:
�����, ��� � �������, ����� � ����� ��������.*/
drop view Staff_n
create view Staff_n AS
select Staff_no, Fname, LName, Street, Stel_no from Staff;
select*from Staff_n

create view staff2 as 
select Staff_no, FName, LName, Street + ' ' + cast(House as varchar(6)) + ' ' + cast(Flat as varchar(6)) adress, Stel_no from staff
select*from staff2
/*34.�������� ��������� ��� ������ ������� ����������� ��������� ��� �������� ���������.*/
create procedure staff_salary
	@branch_no int
as
select branch_no, staff_no, salary from Staff where Branch_no = @Branch_no
exec staff_salary 3

/*35.C������� ��������� ��� ������ ������ ���������� �������������, 
��� ������� ���� ��������� � ������������ ����(�������� ���������).*/
create procedure show_views
	@view_date datetime
	as
select distinct(owner_no) from property where Property_no in 
(select property_no from Viewing where datetime_View like @view_date + '%')

/*36.�������� �������� ��������� ��� ���������� ��� �������� ������������� (��������� ���� �� �������� �������).*/
create procedure price_update
	@indexation float
as
update Property set Selling_Price = Selling_Price * (1 + (@indexation / 100))

exec price_update 1.1

/*37.�������� �������� ��������� ��� �������� ���������� ��������, 
��������� ������������ ����������� (� ��������� ���������� ����� ����������).*/
create procedure count_sells
	@staff_no nvarchar(9)
as 
select count(c.property_no) selled_property_count 
from (select property_no, staff_no from property where Property_no in (select property_no from Contract)) 
c group by c.Staff_no having c.Staff_no = @staff_no

/*38.������� ��������� ��� ��������� ���������� ����� ���������� ������ � ��� ������, ���� �� ��� ��������� ���� �� ���� ������ 
������������� � ������� Property (����� ���������� � ������� ��������� ���������� ����� ���������� � ��������� ��� ���������). */
create procedure sallary_update
	@staff_no nvarchar(9),
	@indexation float
as 
update Staff set Salary = Salary * (1 + (@indexation / 100)) where Staff_no = @staff_no and Staff_no in (select staff_no from Property)

/*39.�������� ������� ��� ���������� �������� ���������� �� 1% ��� ������ �������.*/
create trigger done_selling
on contract
after insert
as
update Staff
set Salary = Salary * 1.01 where Staff_no in (select Staff_no from property where Property_no in (select property_no from inserted))

/*40.�������� ������� ��� �������� �� ������� PROPERTY �������� �������������, 
������������� ���������, ������ � ������� ��������� �� ������� OWNER. �������������� ������� �����������.*/
create trigger property_dell
on owner
after delete
as
delete from Property where Owner_no in (select Owner_no from deleted)

/*41	�������� ������� ��� �������� ������� ������ ��������� Branch_no � ������� BRANCH ��� ����� ����� ������ � ������� BUYER (��� ������� ����� ������)
� ������� ������� ������ ��� ��������� ���������� �����������. �������������� ������� �����������.*/
create trigger check_insert
on buyer
instead of insert
as
if ((select branch_no from inserted) in (select branch_no from Branch)) select 'DATA INTEGRITY WAS BROKE'

/*42.	�������� ������� ��� �������� ��������� ��������, ���� � ���� Comments ������� VIEWING �������� �������� �������� �������.*/

create trigger property_price_d
on viewing
after insert
as
if ((select Comments from inserted) = '������� �������')
	update Property set Selling_Price = 0.9 * Selling_Price where Property_no in (select Property_no from inserted)


select*from Branch;
select*from Owner;
select*from Buyer;
select*from Staff;
select*from Property;
select*from Viewing;
select*from Contract;


