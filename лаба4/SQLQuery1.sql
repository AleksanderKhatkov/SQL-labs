/*Лабораторная работа № 4*/

--1Напишите запрос с подзапросом для получения данных обо всех оценках студента с фамилией «Иванов». Предположим, что его персональный номер неизвестен. 
SELECT * FROM EXAM_MARKS WHERE STUDENT_ID=(SELECT STUDENT_ID FROM STUDENT where SURNAME='Зайцева' and FNAME='Ольга' )
--2Напишите запрос, выбирающий данные об именах всех студентов, имеющих по предмету с идентификатором 22 балл выше общего среднего балла
SELECT FNAME FROM STUDENT, EXAM_MARKS WHERE MARK>=(SELECT AVG(MARK) FROM EXAM_MARKS) AND SUBJ_ID=22 AND STUDENT.STUDENT_ID=EXAM_MARKS.STUDENT_ID
--3Напишите запрос, который выполняет выборку имен всех студентов, имеющих по предмету с идентификатором 22 балл ниже общего среднего балла.
SELECT COUNT(DISTINCT STUDENT_ID), AVG(MARK) FROM EXAM_MARKS GROUP BY MARK HAVING MARK >(SELECT AVG(MARK) FROM EXAM_MARKS WHERE STUDENT_ID=12)
 --4Напишите запрос, выполняющий вывод количества предметов, по которым экзаменовался каждый студент, сдававший более 3 предметов.
SELECT STUDENT_ID, COUNT(SUBJ_ID)  FROM EXAM_MARKS  GROUP BY STUDENT_ID HAVING COUNT(SUBJ_ID)=2
--5Напишите команду SELECT, использующую связанные подзапросы и выполняющую вывод имен и идентификаторов студентов, у которых стипендия совпадает с максимальным значением стипендии для города, в котором живет студент.
select fname from student A where STIPEND=(select max(STIPEND) from STUDENT where A.CITY=CITY)
--Напишите запрос, который позволяет вывести имена и идентификаторы всех студентов, для которых точно известно, что они проживают в городе, где нет ни одного университета.
select FNAME FROM STUDENT A WHERE CITY NOT IN (SELECT CITY FROM UNIVERSITY)





