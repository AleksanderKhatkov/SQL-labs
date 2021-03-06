use master
go
 
/*=========================*/
/********** Удаление таблиц **********/
/*=========================*/

use BDAgenstvo
go

create database BDAgenstvo

declare @sql nvarchar(1000)
declare fk cursor for
select 'alter table ' + object_name(parent_object_id) + ' drop constraint ' + name
from sys.foreign_keys
where referenced_object_id = object_id(N'Branch')
or referenced_object_id = object_id(N'Owner')
or referenced_object_id = object_id(N'Buyer')
or referenced_object_id = object_id(N'Staff')
or referenced_object_id = object_id(N'Property')
or referenced_object_id = object_id(N'Viewing')
or referenced_object_id = object_id(N'Contract')

open fk
fetch next from fk into @sql
while @@FETCH_STATUS = 0
begin
execute sp_executesql @sql
fetch next from fk into @sql
end
close fk
deallocate fk
go

if exists (select * from sys.objects where object_id = object_id(N'Viewing') and type in (N'U'))
drop table Viewing
go
if exists (select * from sys.objects where object_id = object_id(N'Contract') and type in (N'U'))
drop table Contract
go
if exists (select * from sys.objects where object_id = object_id(N'Property') and type in (N'U'))
drop table Property
go
if exists (select * from sys.objects where object_id = object_id(N'Owner') and type in (N'U'))
drop table [Owner]
go
if exists (select * from sys.objects where object_id = object_id(N'Buyer') and type in (N'U'))
drop table Buyer
go
if exists (select * from sys.objects where object_id = object_id(N'Staff') and type in (N'U'))
drop table Staff
go
if exists (select * from sys.objects where object_id = object_id(N'Branch') and type in (N'U'))
drop table Branch
go

/*=========================*/
/********** Создание таблиц **********/
/*=========================*/

create table Branch
(
	Branch_no 	int,
	Postcode 	int,
	City 		nvarchar(20),
	Street 		nvarchar(20),
	House 		nvarchar(20),
	Btel_no 	nvarchar(20),
	Fax_no 		nvarchar(20),
	constraint Branch_PK_Branch_no primary key (Branch_no)
)
go

create table Owner
(
	Owner_no 	int,
	FName 		nvarchar(20),
	LName 		nvarchar(20),
	City 		nvarchar(20),
	Street 		nvarchar(20),
	House 		nvarchar(20),
	Flat 		int,
	Otel_no 	nvarchar(20),
	constraint Owner_PK_Owner_no primary key (Owner_no)
)
go

create table Buyer
(
	Buyer_no 	int,
	FName 		nvarchar(20),
	LName 		nvarchar(20),
	City 		nvarchar(20),
	Street 		nvarchar(20),
	House 		nvarchar(20),
	Flat 		int,
	Htel_no 	nvarchar(20),
	Wtel_no 	nvarchar(20),
	Prof_Rooms 	int,
	Max_Price 	int,
	Branch_no 	int,
	constraint Buyer_PK_Buyer_no primary key (Buyer_no),
	constraint Buyer_FK_Branch_no foreign key (Branch_no) references Branch (Branch_no)
)
go

create table Staff
(
	Staff_no 	nvarchar(9),
	FName 		nvarchar(20),
	LName 		nvarchar(20),
	DOB 		datetime,
	Sex 		nchar(1),
	City 		nvarchar(20),
	Street 		nvarchar(20),
	House 		nvarchar(20),
	Flat 		int,
	Stel_no 	nvarchar(20),
	datetime_Joined 	datetime,
	Position 	nvarchar(20),
	Salary 		int,
	Branch_no 	int,
	constraint Staff_PK_Staff_no primary key (Staff_no),
	constraint Staff_FK_Branch_no foreign key (Branch_no) references Branch (Branch_no)
)
go

create table Property
(
	Property_no 		int,
	datetime_registration 	datetime,
	Postcode 		int,
	City 			nvarchar(20),
	Street 			nvarchar(20),
	House 			nvarchar(20),
	Flat 			int,
	Floor_Type 		nvarchar(3),
	Floor 			int,
	Rooms 			int,
	The_area 		nvarchar(30),
	Balcony 		nvarchar(5),
	Ptel 			nvarchar(1),
	Selling_Price 		int,
	Branch_no 		int,
	Staff_no 		nvarchar(9),
	Owner_no 		int,
	constraint Property_PK_Property_no primary key (Property_no),
	constraint Property_FK_Branch_no foreign key (Branch_no) references Branch (Branch_no),
	constraint Property_FK_Staff_no foreign key (Staff_no) references Staff (Staff_no),
	constraint Property_FK_Owner_no foreign key (Owner_no) references Owner (Owner_no)
)
go

create table Viewing
(
	datetime_View 	datetime,
	Comments 	nvarchar(50),
	Property_no 	int,
	Buyer_no 	int,
	constraint Viewing_FK_Property_no foreign key (Property_no) references Property (Property_no),
	constraint Viewing_FK_Buyer_no foreign key (Buyer_no) references Buyer (Buyer_no)
)
go

create table Contract
(
	Sale_no 	int,
	Notary_Office 	nvarchar(20),
	datetime_Contract 	datetime,
	Service_Cost 	int,
	Property_no 	int,
	Buyer_no 	int,
	constraint Contract_PK_Sale_no primary key (Sale_no),
	constraint Contract_FK_Property_no foreign key (Property_no) references Property (Property_no),
	constraint Contract_FK_Buyer_no foreign key (Buyer_no) references Buyer (Buyer_no)
)
go


/*=========================*/
/********** Вставка данных **********/
/*=========================*/

/* Branch */

insert into Branch (Branch_no, Postcode, City, Street, House, Btel_no, Fax_no)
	values (1, 210009, 'Витебск', 'Замковая', '4/офис404', '8(02122)37-73-56', '37-73-58')
insert into Branch (Branch_no, Postcode, City, Street, House, Btel_no, Fax_no)
	values (2, 210033, 'Витебск', 'Суворова', '9/11', '8(02122)36-01-80', '33-25-23')
insert into Branch (Branch_no, Postcode, City, Street, House, Btel_no, Fax_no)
	values (3, 211440, 'Новополоцк', 'Молодёжная', '18', '8(02144)57-31-29', '57-25-30')
insert into Branch (Branch_no, Postcode, City, Street, House, Btel_no, Fax_no)
	values (4, 211460, 'Россоны', 'Ленина', '3	', '8(02159)25-55-20', null)
go


/* Owner */

insert into Owner (Owner_no, FName, LName, City, Street, House, Flat, Otel_no)
	values (1, 'Жерносек', 'Юрий', 'Витебск', 'Терешковой', '28/1', 7, '62-07-94')
insert into Owner (Owner_no, FName, LName, City, Street, House, Flat, Otel_no)
	values (2, 'Панкратова', 'Инна', 'Новополоцк', 'Парковая', '26', 12, '57-12-48')
insert into Owner (Owner_no, FName, LName, City, Street, House, Flat, Otel_no)
	values (3, 'Амбражевич', 'Сергей', 'Новополоцк', 'Двинская', '5', 18, '52-14-89')
insert into Owner (Owner_no, FName, LName, City, Street, House, Flat, Otel_no)
	values (4, 'Поскрёбышева', 'Елена', 'Витебск', 'П.Бровки', '26/1', 40, '23-00-72(аб978)')
insert into Owner (Owner_no, FName, LName, City, Street, House, Flat, Otel_no)
	values (5, 'Титов', 'Николай', 'Витебск', 'Интернационалистов', '35', 187, '8(029)633-76-68')
insert into Owner (Owner_no, FName, LName, City, Street, House, Flat, Otel_no)
	values (6, 'Скребкова', 'Алла', 'Новополоцк', 'Молодёжная', '1', 22, '8(029)688-84-46')
insert into Owner (Owner_no, FName, LName, City, Street, House, Flat, Otel_no)
	values (7, 'Николаев', 'Влад', 'Витебск', 'Фрунзе', '33', 214, '8(029)673-07-30')
insert into Owner (Owner_no, FName, LName, City, Street, House, Flat, Otel_no)
	values (8, 'Цалко', 'Сергей', 'Лепель', 'Ленина', '14/2', 4, '25-17-90')
insert into Owner (Owner_no, FName, LName, City, Street, House, Flat, Otel_no)
	values (9, 'Цыркунова', 'Наталья', 'Pоссоны', 'Цветочная', '90', 15, '26-32-48')
insert into Owner (Owner_no, FName, LName, City, Street, House, Flat, Otel_no)
	values (10, 'Яковлев', 'Андрей', 'Витебск', 'Лазо', '65', null, '21-72-25')
go


/* Buyer */

insert into Buyer (Buyer_no, FName, LName, City, Street, House, Flat, Htel_no, Wtel_no, Prof_Rooms, Max_Price, Branch_no)
	values (1, 'Невердасов', 'Виктор', 'Витебск', 'Московский пр-т', '16/4', 117, '62-08-19', '36-40-80', 2, 11000, 2)
insert into Buyer (Buyer_no, FName, LName, City, Street, House, Flat, Htel_no, Wtel_no, Prof_Rooms, Max_Price, Branch_no)
	values (2, 'Кассап', 'Светлана', 'Новополоцк', 'Гайдара', '17а', 4, '57-12-48', null, 1, 7800, 3)
insert into Buyer (Buyer_no, FName, LName, City, Street, House, Flat, Htel_no, Wtel_no, Prof_Rooms, Max_Price, Branch_no)
	values (3, 'Орлов', 'Александр', 'Минск', 'Либнехта', '93', 15, '8(017)286-13-21', null, 3, 14500, 1)
insert into Buyer (Buyer_no, FName, LName, City, Street, House, Flat, Htel_no, Wtel_no, Prof_Rooms, Max_Price, Branch_no)
	values (4, 'Сафронова', 'Светлана', 'Витебск', 'пр-т Победы', '3/1', 324, '8(029)661-07-30', '22-67-94', 2, 6000, 4)
insert into Buyer (Buyer_no, FName, LName, City, Street, House, Flat, Htel_no, Wtel_no, Prof_Rooms, Max_Price, Branch_no)
	values (5, 'Окорков', 'Вадим', 'Минск', 'Лермонтова', '35', 187, null, '8(017)224-84-24', 5, 30000, 1)
insert into Buyer (Buyer_no, FName, LName, City, Street, House, Flat, Htel_no, Wtel_no, Prof_Rooms, Max_Price, Branch_no)
	values (6, 'Семёнов', 'Вячеслав', 'Витебск', 'Замковая', '4', 13, '23-00-72(аб964)', null, 2, 10500, 1)
insert into Buyer (Buyer_no, FName, LName, City, Street, House, Flat, Htel_no, Wtel_no, Prof_Rooms, Max_Price, Branch_no)
	values (7, 'Краснова', 'Жанна', 'Витебск', 'Клиническая', '104', null, null, '23-50-70', 1, 9000, 2)
insert into Buyer (Buyer_no, FName, LName, City, Street, House, Flat, Htel_no, Wtel_no, Prof_Rooms, Max_Price, Branch_no)
	values (8, 'Будда', 'Елена', 'Лепель', 'Ленина', '3', 5, '25-17-90', null, 4, 20000, 3)
insert into Buyer (Buyer_no, FName, LName, City, Street, House, Flat, Htel_no, Wtel_no, Prof_Rooms, Max_Price, Branch_no)
	values (9, 'Боровая', 'Наталья', 'Орша', 'Смоленская', '12/4', 26, '26-32-48', null, 2, 14000, 2)
insert into Buyer (Buyer_no, FName, LName, City, Street, House, Flat, Htel_no, Wtel_no, Prof_Rooms, Max_Price, Branch_no)
	values (10, 'Алипов', 'Игорь', 'Витебск', 'Московский пр-т', '22', 4, '21-72-25', null, 3, 15000, 2)
go


/* Staff */

insert into Staff (Staff_no, FName, LName, DOB, Sex, City, Street, House, Flat, Stel_no, datetime_Joined, Position, Salary, Branch_no)
	values ('BMO550260', 'Батуркин', 'Александр', convert(datetime, '17.10.68', 4), 'М', 'Новополоцк', 'Парковая', '5', 13, '23-79-77', convert(datetime, '01.01.92', 4), 'менеджер', 250000, 3)
insert into Staff (Staff_no, FName, LName, DOB, Sex, City, Street, House, Flat, Stel_no, datetime_Joined, Position, Salary, Branch_no)
	values ('BMO550261', 'Чубаро', 'Наталья', convert(datetime, '25.05.72', 4), 'Ж', 'Витебск', 'Чкалова', '21/1', 12, '8(029)662-47-32', convert(datetime, '10.02.91', 4), 'торговый агент', 180000, 1)
insert into Staff (Staff_no, FName, LName, DOB, Sex, City, Street, House, Flat, Stel_no, datetime_Joined, Position, Salary, Branch_no)
	values ('BMO550262', 'Коваленко', 'Светлана', convert(datetime, '01.02.70', 4), 'Ж', 'Витебск', 'Чкалова', '24', 49, '62-51-23', convert(datetime, '15.01.19', 4), 'менеджер', 250000, 3)
insert into Staff (Staff_no, FName, LName, DOB, Sex, City, Street, House, Flat, Stel_no, datetime_Joined, Position, Salary, Branch_no)
	values ('BMO550263', 'Логинов', 'Вадим', convert(datetime, '09.09.67', 4), 'М', 'Витебск', 'Чкалова', '41/2', 96, '23-06-73', convert(datetime, '02.09.90', 4), 'директор', 300000, 1)
insert into Staff (Staff_no, FName, LName, DOB, Sex, City, Street, House, Flat, Stel_no, datetime_Joined, Position, Salary, Branch_no)
	values ('BMO550264', 'Суворов', 'Виталий', convert(datetime, '11.07.65', 4), 'М', 'Новополоцк', 'Школьная', '47/1', 157, '22-29-03', convert(datetime, '01.02.17', 4), 'торговый агент', 180000, 3)
insert into Staff (Staff_no, FName, LName, DOB, Sex, City, Street, House, Flat, Stel_no, datetime_Joined, Position, Salary, Branch_no)
	values ('BMO550265', 'Жарков', 'Герман', convert(datetime, '06.03.68', 4), 'М', 'Витебск', 'Гагарина', '31', 28, '63-43-98', convert(datetime, '02.10.16', 4), 'менеджер', 280000, 2)
insert into Staff (Staff_no, FName, LName, DOB, Sex, City, Street, House, Flat, Stel_no, datetime_Joined, Position, Salary, Branch_no)
	values ('BMO550266', 'Ганушенко', 'Галина', convert(datetime, '05.11.69', 4), 'Ж', 'Витебск', 'Лазо', '90/1', 54, '62-43-64', convert(datetime, '03.11.16', 4), 'торговый агент', 180000, 2)
insert into Staff (Staff_no, FName, LName, DOB, Sex, City, Street, House, Flat, Stel_no, datetime_Joined, Position, Salary, Branch_no)
	values ('BMO550267', 'Сотникова', 'Ольга', convert(datetime, '07.12.67', 4), 'Ж', 'Полоцк', 'Вокзальная', '7', null, null, convert(datetime, '02.02.02', 4), 'маклер', 100000, 3)
insert into Staff (Staff_no, FName, LName, DOB, Sex, City, Street, House, Flat, Stel_no, datetime_Joined, Position, Salary, Branch_no)
	values ('BMO550268', 'Янчиленко', 'Сергей', convert(datetime, '28.02.70', 4), 'М', 'Россоны', 'Ленина', '28/2', 25, null, convert(datetime, '17.05.02', 4), 'торговый агент', 150000, 4)
go


/* Property */

insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3000, convert(datetime, '16.10.19', 4), 210033, 'Витебск', 'Смоленская', 'И', 57, '5П', 3, 1, '31/18/6,5', 'Б', 'T', 6000, 1, 'BMO550262', 1)
insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3001, convert(datetime, '17.10.19', 4), 210035, 'Витебск', 'Бровки', 'И', 49, '9К', 9, 1, '37/21/7', 'Бз', '-', 7000, 2, 'BMO550262', 5)
insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3002, convert(datetime, '18.10.19', 4), 210029, 'Витебск', 'Строителей', '23/2', 214, '12П', 12, 2, '51/29/9', 'Лз', 'T', 10200, 2, 'BMO550266', 7)
insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3003, convert(datetime, '19.10.19', 4), 210005, 'Витебск', 'Лазо', '11', 4, 'ЗК', 3, 2, '65/40/7,6', '2Бз', '-', 13500, 1, 'BMO550261', 5)
insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3004, convert(datetime, '15.12.16', 4), 211460, 'Россоны', 'Ленина', '32', 20, '5П', 5, 3, '68,4/44,3/9,81', '2Бз', 'T', 10000, 4, 'BMO550268', 7)
insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3005, convert(datetime, '11.12.16', 4), 211440, 'Новопол.', 'Школьная', '11', 56, '9П', 3, 1, '36/18/8,2', 'Б', 'T', 7500, 3, 'BMO550260', 6)
insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3006, convert(datetime, '14.12.17', 4), 211440, 'Новопол.', 'Молодёжная', '5', 14, '9П', 2, 2, '46/27/6,8', 'Лз', 'T', 10000, 3, 'BMO550264', 3)
insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3007, convert(datetime, '20.12.18', 4), 211180, 'Полоцк', 'Вокзальная', '8', 15, '5К', 5, 3, '65/38/7', 'Б', 'T', 8000, 3, 'BMO550267', 2)
insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3008, convert(datetime, '16.01.18', 4), 211460, 'Россоны', 'Советская', '17', 1, '5К', 1, 3, '65/38/7', '-', 'T', 7500, 4, 'BMO550268', 7)


insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3009, convert(datetime, '16.11.19', 4), 210033, 'Витебск', 'Смоленская', 'И', 57, '5П', 3, 1, '31/18/6,5', 'Б', 'T', 6000, 1, 'BMO550262', 1)
insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3010, convert(datetime, '17.11.19', 4), 210035, 'Витебск', 'Бровки', 'И', 49, '9К', 9, 1, '37/21/7', 'Бз', '-', 7000, 2, 'BMO550262', 5)
insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3011, convert(datetime, '18.11.19', 4), 210029, 'Витебск', 'Строителей', '23/2', 214, '12П', 12, 2, '51/29/9', 'Лз', 'T', 10200, 2, 'BMO550266', 7)
insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3011, convert(datetime, '19.11.19', 4), 210005, 'Витебск', 'Лазо', '11', 4, 'ЗК', 3, 2, '65/40/7,6', '2Бз', '-', 13500, 1, 'BMO550261', 5)
insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3012, convert(datetime, '15.11.19', 4), 211460, 'Россоны', 'Ленина', '32', 20, '5П', 5, 3, '68,4/44,3/9,81', '2Бз', 'T', 10000, 4, 'BMO550268', 7)
insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3013, convert(datetime, '11.11.19', 4), 211440, 'Новопол.', 'Школьная', '11', 56, '9П', 3, 1, '36/18/8,2', 'Б', 'T', 7500, 3, 'BMO550260', 6)
insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3014, convert(datetime, '14.11.19', 4), 211440, 'Новопол.', 'Молодёжная', '5', 14, '9П', 2, 2, '46/27/6,8', 'Лз', 'T', 10000, 3, 'BMO550264', 3)
insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3015, convert(datetime, '20.11.19', 4), 211180, 'Полоцк', 'Вокзальная', '8', 15, '5К', 5, 3, '65/38/7', 'Б', 'T', 8000, 3, 'BMO550267', 2)
insert into Property (Property_no, datetime_registration, Postcode, City, Street, House, Flat, Floor_Type, Floor, Rooms, The_area, Balcony, Ptel, Selling_Price, Branch_no, Staff_no, Owner_no)
	values (3016, convert(datetime, '16.11.19', 4), 211460, 'Россоны', 'Советская', '17', 1, '5К', 1, 3, '65/38/7', '-', 'T', 7500, 4, 'BMO550268', 7)
go


/* Viewing */

insert into Viewing (datetime_View, Comments, Property_no, Buyer_no)
	values (convert(datetime, '17.11.19', 4), 'Не согласен', 3002, 1)
insert into Viewing (datetime_View, Comments, Property_no, Buyer_no)
	values (convert(datetime, '17.11.19', 4), 'Согласен', 3003, 1)
insert into Viewing (datetime_View, Comments, Property_no, Buyer_no)
	values (convert(datetime, '18.11.19', 4), 'Не согласен', 3002, 4)
insert into Viewing (datetime_View, Comments, Property_no, Buyer_no)
	values (convert(datetime, '19.11.19', 4), 'Согласен', 3005, 2)
insert into Viewing (datetime_View, Comments, Property_no, Buyer_no)
	values (convert(datetime, '25.11.19', 4), 'Требует ремонта', 3001, 7)
	insert into Viewing (datetime_View, Comments, Property_no, Buyer_no)
	values (convert(datetime, '17.11.19', 4), 'Не согласен', 3002, 1)
insert into Viewing (datetime_View, Comments, Property_no, Buyer_no)
	values (convert(datetime, '17.11.19', 4), 'Согласен', 3003, 1)
insert into Viewing (datetime_View, Comments, Property_no, Buyer_no)
	values (convert(datetime, '18.11.19', 4), 'Не согласен', 3002, 4)
insert into Viewing (datetime_View, Comments, Property_no, Buyer_no)
	values (convert(datetime, '19.11.19', 4), 'Согласен', 3005, 2)
insert into Viewing (datetime_View, Comments, Property_no, Buyer_no)
	values (convert(datetime, '25.11.19', 4), 'Требует ремонта', 3001, 7)
go


/* Contract */

insert into Contract (Sale_no, Notary_Office, datetime_Contract, Service_Cost, Property_no, Buyer_no)
	values (1001, 'Офис 1', convert(datetime, '03.12.19', 4), 13500, 3009, 1)
insert into Contract (Sale_no, Notary_Office, datetime_Contract, Service_Cost, Property_no, Buyer_no)
	values (1002, 'Офис 1', convert(datetime, '03.12.19', 4), 7500, 3010, 2)
	insert into Contract (Sale_no, Notary_Office, datetime_Contract, Service_Cost, Property_no, Buyer_no)
	values (1001, 'Офис 1', convert(datetime, '01.12.19', 4), 13500, 3011, 1)
insert into Contract (Sale_no, Notary_Office, datetime_Contract, Service_Cost, Property_no, Buyer_no)
	values (1002, 'Офис 1', convert(datetime, '01.12.19', 4), 7500, 3012, 2)
	insert into Contract (Sale_no, Notary_Office, datetime_Contract, Service_Cost, Property_no, Buyer_no)
	values (1001, 'Офис 1', convert(datetime, '02.12.19', 4), 13500, 3013, 1)
insert into Contract (Sale_no, Notary_Office, datetime_Contract, Service_Cost, Property_no, Buyer_no)
	values (1002, 'Офис 1', convert(datetime, '03.12.19', 4), 7500, 3014, 2)
go


