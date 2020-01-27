/*3 Создать представление для учебного отдела, содержащее данные о результатах сдачи сессии*/
CREATE VIEW  Результаты_здачии_сесии AS 
Select Экзамен.id_Экзамен, Экзамен.id_Группа, Экзамен.Дата, Экзамен.Адитория,Экзамен.id_Предмет_Преподаватель, 
Оценки.допуск, Оценки.Оценка, Студент.id_Номер_зачетн_книги,Студент.Имя,Студент.Отчеставо, Студент.Фамилия, Студент.Стипендия
from Экзамен JOIN Оценки ON  Экзамен.id_Экзамен=Оценки.id_Экзамен 
JOIN Студент ON Студент.id_Номер_зачетн_книги=Оценки.id_Номер_зачетн_книги Where Оценки.допуск='допущен'; 
select*from Результаты_здачии_сесии;

/*4.Создать хранимы процедуры 
1.Для повышенния стипендии отличникам на 10%*/
drop procedure stipend -- удаление процедуры
use Институт
go
CREATE PROCEDURE Stipend (@STIPED decimal (10)) AS 
BEGIN
UPDATE Студент SET @STIPED=@STIPED*1.1 Where Студент.id_Номер_зачетн_книги in (select Оценки.id_Номер_зачетн_книги from Студент JOIN Оценки ON 
Студент.id_Номер_зачетн_книги=Оценки.id_Номер_зачетн_книги Where Оценки.Оценка=10)
END 
EXEC Stipend 100 --ЗАПУСК ХРАНИМОЙ ПРОЦЕДУРЫ 
select*from Студент

/*2.Для перевода студентов на следующий курс*/
drop procedure student_curs;
GO
CREATE PROCEDURE student_curs (@curs decimal (10)) AS
SET @curs = 0
BEGIN
UPDATE Группа SET @curs=@curs+1 Where EXISTS (select Группа.Курс from Студент 
JOIN Группа ON Студент.id_Группа=Группа.id_Группа Where @curs<=5)
END;
EXEC student_curs @curs=0;
select*from Группа

/*3.Для отчисления студентов, получившего более трех неудавлетворительных отметок (от 1 до 3 баллов) в сессию */
drop procedure date_exsamen;
GO
CREATE PROCEDURE date_exsamen (@date1 date, @date2 date) AS
BEGIN
SELECT DISTINCT Студент.id_Номер_зачетн_книги, Студент.Фамилия, Студент.Имя FROM Студент 
JOIN Оценки ON Студент.id_Номер_зачетн_книги=Оценки.id_Номер_зачетн_книги 
JOIN Экзамен ON Экзамен.id_Экзамен=Оценки.id_Экзамен
Where Оценки.Оценка<=3 and Экзамен.Дата BETWEEN @date1 and @date2;
END
EXEC date_exsamen @date1='2019-05-10', @date2='2019-05-17';


/*4. Для изменения отметки при успешной пересдаче экзамена*/
drop procedure access_student;
GO
CREATE PROCEDURE access_student (@name varchar(20),@surname varchar(20), @fname varchar(20),@mark int, @date1 date, @date2 date)
AS
BEGIN
insert into access_student (@name, @surname,  @fname, @mark, @date1, @date2) values (@name, @surname,  @fname, @mark, @date1, @date2)
END
EXEC access_student @name='Александр', @surname='Александрович', @fname ='Саньков', @mark =10, @date1 ='2019-05-10', @date2 ='2019-05-17'; 