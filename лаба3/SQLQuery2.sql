/* Лабароторная работа 3*/

--1Напишите запрос для подсчета количества студентов, сдававших экзамен по предмету обучения с идентификатором, равным 22.
SELECT COUNT(STUDENT_ID) FROM EXAM_MARKS WHERE SUBJ_ID =22 --1
--2Напишите запрос для подсчета в таблице EXAM_MARKS кол-во различных предметов обучения.
SELECT COUNT(DISTINCT (STUDENT_ID)) FROM EXAM_MARKS;
--3Напишите запрос, который выполняет выборку для каждого студента значения его идентификатора и минимальной из полученных им оценок.
SELECT STUDENT_ID, MIN(MARK) FROM EXAM_MARKS GROUP BY STUDENT_ID
--4Напишите запрос, осуществляющий выборку для каждого студента значения его идентификатора и максимальной из полученных им оценок.
SELECT STUDENT_ID, MAX(MARK) FROM EXAM_MARKS GROUP BY STUDENT_ID
--5Напишите запрос, выполняющий вывод фамилии первого в алфавитном порядке (по фамилии) студента, фамилия которого начинается на букву «И».
SELECT SURNAME FROM STUDENT WHERE SURNAME LIKE 'И%';
--6Напишите запрос, который выполняет вывод (для каждого предмета обучения) наименования предмета и максимального значения номера семестра, в котором этот предмет преподается.
SELECT SUBJ_NAME, MAX(SEMESTR) AS SEMESTR FROM SUBJECT GROUP BY SUBJ_NAME;
--7Напишите запрос, который выполняет вывод данных для каждого конкретного дня сдачи экзамена о количестве студентов, сдававших экзамен в этот день.
--SELECT STUDENT_ID, SUBJ_ID, COUNT(STUDENT_ID) FROM EXAM_MARKS GROUP BY EXAM_DATE

--SELECT AVG(MARK) AS AVERGE_MARK, SUBJ_ID FROM EXAM_MARKS GROUP BY STUDENT_ID;--7

--SELECT COUNT(SUBJ_ID) AS SUBJ_C, (1+SEMESTR)/2 AS COUNTS FROM SUBJECT group by; --8


