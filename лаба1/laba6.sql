select surname,fname,kurs from STUDENT Where kurs >=3;--5
SELECT *FROM STUDENT WHERE STIPEND >140; --6
SELECT *FROM SUBJECT WHERE KHOUR > 30; --7
SELECT UNIV_NAME, RAITING FROM UNIVERSITY WHERE RAITING > 300; --8
SELECT SURNAME, FNAME,KURS
FROM STUDENT WHERE STIPEND >=100 AND CITY='Воронеж'; --9

/*SELECT *FROM STUDENT WHERE STIPEND<100  OR STUDENT_id>100;

SELECT*FROM STUDENT WHERE NOT((BIRTHDAY=5/11/1979 OR STIPEND<100))
AND STUDENT_ID<12* 10/

SELECT*--11
FROM exam_marks WHERE 
CONVERT (date,exam_date,104)BETWEEN  
convert (date, '10.01.1991',104) and 
convert (date, '20.01.2000',104)

select SUBJ_ID from EXAM_MARKS where (student_id = 12 or student_id= 32) and MARK is not null and MARK>=3; --12
Select subj_id from SUBJECT where subj_name like 'И%'; --13
Select STUDENT_ID from STUDENT where FNAME like 'И%' or fname like 'С%'; --14
select *from EXAM_MARKS where  mark is not null; --15







