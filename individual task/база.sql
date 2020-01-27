--DROP DATABASE Институт -- удалить базу
CREATE DATABASE  Институт -- создать базу 

CREATE TABLE Кафедра
(
id_Кафедра INT PRIMARY KEY,
Название varchar(50))

go
insert into Кафедра values(1,'Вычислительных методов и программирования');
insert into Кафедра values(2,'Программного обеспечения информационных технологий');
go


CREATE TABLE Группа
(
id_Группа INT PRIMARY KEY,
Номер INT,
Курс INT check (1 <= Курс and Курс <= 5)) -- check1 (ограничение)


go
insert into Группа values(1,100,1);
insert into Группа values(2,200,2);
insert into Группа values(3,300,3);
insert into Группа values(4,400,4);
insert into Группа values(5,500,5);
go


CREATE TABLE Преподаватель
(
id_Преподаватель INT PRIMARY KEY,
Имя varchar(20),
Отчество varchar(20),
Фамилия varchar(20),
id_Кафедра int references Кафедра(id_Кафедра)) -- внешний ключь

go
insert into Преподаватель values(1,'Ирина','Петровна','Стасук', 1);
insert into Преподаватель values(2,'Ирина','Кондранко','Игоревна', 1);
insert into Преподаватель values(3,'Рубкова','Елена','Владимеровна', 1);
insert into Преподаватель values(4,'Гришкевич','Елена','Георгевна', 1);
insert into Преподаватель values(5,'Яшкевич','Светлана','Владимеровна', 2);
insert into Преподаватель values(6,'Александр','Александрович','Милещенко', 2);
insert into Преподаватель values(7,'Витали','Владимерович','Фуфаев', 2);
insert into Преподаватель values(8,'Наталья','Леонидовна','Черкас', 2);
go


CREATE TABLE Студент
(
id_Номер_зачетн_книги INT PRIMARY KEY,
Имя varchar(20),
Отчеставо varchar(20),
Фамилия varchar(20),
Стипендия int,
id_Группа int references Группа(id_Группа))

go
insert into Студент values(1,'Сергей','Николаевич','Скепко', 100,1);
insert into Студент values(2,'Марина','Игоревна','Шаладонова',150,1);
insert into Студент values(3,'Станислав','Николаевич','Колтыков',90,1);
insert into Студент values(4,'Дмитри','Александрович','Хатьков',150,2);
insert into Студент values(5,'Денис','Викторович','Волкович',130,2);
insert into Студент values(6,'Альберт','Дмитрович','Брутский',120,2);
insert into Студент values(7,'Сергей','Александрович','Винников',140,3);
insert into Студент values(8,'Алена','Олеговна','Коваленко',200,3);
insert into Студент values(9,'Евгени','Евгенович','Швайбович',140,3);
insert into Студент values(10,'Сергей','Владимерович','Полещук',110,4);
insert into Студент values(11,'Евгени','Викторович','Антонов',250,4);
insert into Студент values(12,'Алена','Олеговна','Гриберг',100,4);
insert into Студент values(13,'Николай','Михайлович','Кравец',120,5);
insert into Студент values(14,'Светлана','Николаевна','Рапацевич',155,5);
insert into Студент values(15,'Илья','Антонович','Сотиков',167,5);
go


CREATE TABLE Предмет
(
id_Предмет INT PRIMARY KEY,
Название varchar(40)
)

go
insert into Предмет values(1,'база данных');
insert into Предмет values(2,'интернет технологии');
insert into Предмет values(3,'программное обеспечение безопасности');
insert into Предмет values(4,'основы ООП');
insert into Предмет values(5,'манежмент');
go


CREATE TABLE Предмет_Преподаватель
(
id_Предмет_Преподаватель INT PRIMARY KEY,
id_Преподаватель int references Преподаватель(id_Преподаватель),
id_Предмет int references Предмет(id_Предмет)
)


go
insert into Предмет_Преподаватель values(1,8,1);
insert into Предмет_Преподаватель values(2,7,2);
insert into Предмет_Преподаватель values(3,6,3);
insert into Предмет_Преподаватель values(4,2,4);
insert into Предмет_Преподаватель values(5,5,5);
insert into Предмет_Преподаватель values(6,4,2);
insert into Предмет_Преподаватель values(7,1,3);
insert into Предмет_Преподаватель values(8,3,4);
go


CREATE TABLE Экзамен
(
id_Экзамен INT PRIMARY KEY,
Адитория VARCHAR(20),
Дата date,
id_Предмет_Преподаватель int references Предмет_Преподаватель(id_Предмет_Преподаватель),
id_Группа int references Группа(id_Группа))

go
insert into Экзамен values(1,'250A','2019-05-10',1,1); 
insert into Экзамен values(2,'250A','2019-05-11',2,2);
insert into Экзамен values(3,'450B','2019-05-15',3,3);
insert into Экзамен values(4,'450B','2019-05-16',4,4);
insert into Экзамен values(5,'450B','2019-05-17',5,5);
go


CREATE TABLE Оценки
(
id_Номер_зачетн_книги int references Студент(id_Номер_зачетн_книги),
id_Экзамен int references Экзамен(id_Экзамен),
Допуск VARCHAR(20) check(допуск = 'допущен' or допуск='не допущен'),--check2
Оценка INT check(1 <= Оценка and Оценка <= 10)) --check3


go
insert into Оценки values(1,1,'допущен', 8);
insert into Оценки values(1,2,'допущен', 9);
insert into Оценки values(1,3,'допущен', 7);
insert into Оценки values(1,4,'допущен', 9);
insert into Оценки values(1,5,'допущен', 9);

insert into Оценки values(2,1,'допущен', 6);
insert into Оценки values(2,2,'допущен', 4);
insert into Оценки values(2,3,'допущен', 7);
insert into Оценки values(2,4,'допущен', 7);
insert into Оценки values(2,5,'допущен', 7);

insert into Оценки values(3,1,'не допущен', 2);
insert into Оценки values(3,2,'не допущен', 2);
insert into Оценки values(3,3,'не допущен', 2);
insert into Оценки values(3,4,'не допущен', 2);
insert into Оценки values(3,5,'не допущен', 3);

insert into Оценки values(4,1,'допущен', 10);
insert into Оценки values(4,2,'допущен', 10);
insert into Оценки values(4,3,'допущен', 10);
insert into Оценки values(4,4,'допущен', 10);
insert into Оценки values(4,5,'допущен', 10);

insert into Оценки values(5,1,'допущен', 10);
insert into Оценки values(5,2,'допущен', 10);
insert into Оценки values(5,3,'допущен', 10);
insert into Оценки values(5,4,'допущен', 10);
insert into Оценки values(5,5,'допущен', 10);

insert into Оценки values(6,1,'допущен', 8);
insert into Оценки values(6,2,'допущен', 5);
insert into Оценки values(6,3,'допущен', 4);
insert into Оценки values(6,4,'допущен', 7);
insert into Оценки values(6,5,'допущен', 9);

insert into Оценки values(7,1,'допущен', 7);
insert into Оценки values(7,2,'допущен', 5);
insert into Оценки values(7,3,'допущен', 5);
insert into Оценки values(7,4,'допущен', 8);
insert into Оценки values(7,5,'допущен', 9);

insert into Оценки values(8,1,'допущен', 8);
insert into Оценки values(8,2,'допущен', 9);
insert into Оценки values(8,3,'допущен', 7);
insert into Оценки values(8,4,'допущен', 9);
insert into Оценки values(8,5,'допущен', 10);

insert into Оценки values(9,1,'допущен', 4);
insert into Оценки values(9,2,'допущен', 4);
insert into Оценки values(9,3,'допущен', 5);
insert into Оценки values(9,4,'допущен', 6);
insert into Оценки values(9,5,'допущен', 8);

insert into Оценки values(10,1,'допущен', 7);
insert into Оценки values(10,2,'допущен', 8);
insert into Оценки values(10,3,'допущен', 8);
insert into Оценки values(10,4,'допущен', 9);
insert into Оценки values(10,5,'допущен', 9);

insert into Оценки values(11,1,'допущен', 9);
insert into Оценки values(11,2,'допущен', 10);
insert into Оценки values(11,3,'допущен', 9);
insert into Оценки values(11,4,'допущен', 7);
insert into Оценки values(11,5,'допущен', 9);

insert into Оценки values(12,1,'не допущен', 3);
insert into Оценки values(12,2,'не допущен', 3);
insert into Оценки values(12,3,'не допущен', 3);
insert into Оценки values(12,4,'допущен', 7);
insert into Оценки values(12,5,'допущен', 9);

insert into Оценки values(13,1,'не допущен', 2);
insert into Оценки values(13,2,'не допущен', 2);
insert into Оценки values(13,3,'не допущен', 2);
insert into Оценки values(13,4,'не допущен', 2);
insert into Оценки values(13,5,'не допущен', 3);

insert into Оценки values(14,1,'допущен', 7);
insert into Оценки values(14,2,'допущен', 10);
insert into Оценки values(14,3,'допущен', 8);
insert into Оценки values(14,4,'допущен', 9);
insert into Оценки values(14,5,'допущен', 8);

insert into Оценки values(15,1,'допущен', 8);
insert into Оценки values(15,2,'допущен', 9);
insert into Оценки values(15,3,'допущен', 7);
insert into Оценки values(15,4,'допущен', 7);
insert into Оценки values(15,5,'допущен', 6);
go


select*from Кафедра
select*from Группа
select*from Преподаватель
select*from Студент
select*from Предмет
select*from Предмет_Преподаватель
select*from Экзамен
select*from Оценки

--Alter table Студент add степендия numeric(10,0) --добавить новый столбец 
--Alter table Студент DROP COLUMN степендия; -- удалить новый столбец

--DROP DATABASE Институт
--DROP table 



