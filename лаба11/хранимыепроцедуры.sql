/*Хранимые процедуры*/

Create procedure new_stud
(@STUDENT_ID INT , 
@SURNAME VARCHAR(20), 
@FNAME VARCHAR(12), 
@STIPEND NUMERIC(10,0), 
@KURS INT,
@CITY VARCHAR(20), 
@BIRTHDAY VARCHAR(20), 
@UNIV_ID INT)

AS
INSERT INTO STUDENT
VALUES (@STUDENT_ID, @SURNAME, @FNAME, @STIPEND, @KURS, @CITY, @BIRTHDAY,@UNIV_ID)
EXEC new_stud 265, 'Иванов', 'Ивановеч', 'Бурько', 200, 4, 'Минск', '1020.2008',2;