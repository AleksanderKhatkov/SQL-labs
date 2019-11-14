/*Практическая работа №1*/


SELECT SUBJ_ID, SUBJ_NAME,KHOUR,SEMESTR
FROM SUBJECT;--1

SELECT*FROM EXAM_MARKS
WHERE subj_id ='22'; --2

SELECT KURS,SURNAME,fname
FROM STUDENT;--3

SELECT SUBJ_NAME,KHOUR
FROM SUBJECT
WHERE SEMESTR=4; --4

select surname,fname,kurs
from STUDENT
Where kurs >=3;--5

select surname,fname,kurs from STUDENT Where kurs >=3;--6
SELECT *FROM STUDENT WHERE STIPEND >140; --7
SELECT *FROM SUBJECT WHERE KHOUR > 30; --8
SELECT UNIV_NAME, RAITING FROM UNIVERSITY WHERE RAITING > 300; --9
SELECT SURNAME, FNAME,KURS
FROM STUDENT WHERE STIPEND >=100 AND CITY='???????'; --10

SELECT *FROM STUDENT WHERE STIPEND<100  OR STUDENT_id>100;

SELECT*FROM STUDENT WHERE NOT((BIRTHDAY=5/11/1979 OR STIPEND<100))
AND STUDENT_ID<12* 10/

SELECT*--11
FROM exam_marks WHERE 
CONVERT (date,exam_date,104)BETWEEN  
convert (date, '10.01.1991',104) and 
convert (date, '20.01.2000',104)

select SUBJ_ID from EXAM_MARKS where (student_id = 12 or student_id= 32) and MARK is not null and MARK>=3; --12
Select subj_id from SUBJECT where subj_name like '?%'; --13
Select STUDENT_ID from STUDENT where FNAME like '?%' or fname like '?%'; --14
select *from EXAM_MARKS where  mark is not null; --15
