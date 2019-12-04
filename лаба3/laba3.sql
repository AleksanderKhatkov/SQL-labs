/* Лабароторная работа 3*/

--1.Напишите запрос для подсчета количества студентов, сдававших экзамен по предмету обучения с идентификатором, равным 22.
SELECT COUNT(STUDENT_ID) FROM EXAM_MARKS WHERE SUBJ_ID =22;
--2.Напишите запрос для подсчета в таблице EXAM_MARKS кол-во различных предметов обучения.
SELECT COUNT(DISTINCT (STUDENT_ID)) FROM EXAM_MARKS;
--3.Напишите запрос, который выполняет выборку для каждого студента значения его идентификатора и минимальной из полученных им оценок.
SELECT STUDENT_ID, MIN(MARK) FROM EXAM_MARKS GROUP BY STUDENT_ID;
--4.Напишите запрос, осуществляющий выборку для каждого студента значения его идентификатора и максимальной из полученных им оценок.
SELECT STUDENT_ID, MAX(MARK) FROM EXAM_MARKS GROUP BY STUDENT_ID;
--5.Напишите запрос, выполняющий вывод фамилии первого в алфавитном порядке (по фамилии) студента, фамилия которого начинается на букву «И».
SELECT SURNAME FROM STUDENT WHERE SURNAME LIKE 'И%';
--6.Напишите запрос, который выполняет вывод (для каждого предмета обучения) наименования предмета и максимального значения номера семестра, в котором этот предмет преподается.
SELECT SUBJ_NAME, MAX(SEMESTR) AS SEMESTR FROM SUBJECT GROUP BY SUBJ_NAME;
--7.Напишите запрос, который выполняет вывод данных для каждого конкретного дня сдачи экзамена о количестве студентов, сдававших экзамен в этот день.
select EXAM_DATE, count(STUDENT_ID) as st_count from EXAM_MARKS group by EXAM_DATE;
--8.Напишите запрос для получения среднего балла для каждого курса по каждому предмету.
select AVG(MARK) as subj_mark, SUBJ_ID from EXAM_MARKS group by SUBJ_ID;
--9.Напишите запрос для получения среднего балла для каждого студента.
select AVG(MARK) as student_mark, STUDENT_ID from EXAM_MARKS group by STUDENT_ID;
--10.Напишите запрос для получения среднего балла для каждого экзамена.
Select AVG(MARK) as exam_mark, EXAM_ID From EXAM_MARKS group by EXAM_ID;
--11.Напишите запрос для определения количества студентов, сдававших каждый экзамен
Select COUNT(STUDENT_ID) as student_count, EXAM_ID From EXAM_MARKS  Where mark is not null Group By EXAM_ID;
--12.Напишите запрос для определения количества изучаемых предметов на каждом курсе
Select COUNT(SUBJ_ID) as subjectid, ((SEMESTR +1)/2) as KURS_NUMBER FROM SUBJECT Group BY ((SEMESTR + 1) / 2);
/*13.Предположим, что стипендия всем студентам увеличена на 20%. Напишите запрос к таблице STUDENT, 
выполняющий вывод номера студента, фамилию студента и величину увеличенной стипендии. 
Выходные данные упорядочить: а) по значению последнего столбца (величине стипендии); б) 
в алфавитном порядке фамилий студентов.*/
Select STUDENT_ID, SURNAME, STIPEND*1.2 as stipend from STUDENT order by stipend;
select STUDENT_ID, SURNAME, STIPEND*1.2 as stipend from STUDENT order by SURNAME;
/*14.Напишите запрос, который по таблице EXAM_MARKS позволяет найти а)
максимальные и б) минимальные оценки каждого студента и который выводит их вместе с идентификатором студента*/
Select STUDENT_ID, max(MARK) as mark_max, min(MARK) as mark_min  From EXAM_MARKS Group by STUDENT_ID;
/*15. Напишите запрос, выполняющий вывод списка предметов обучения в порядке 
а) убывания семестров и б) возрастания отводимых на предмет часов. Поле семестра в выходных данных 
должно быть первым, за ним должны следовать имя предмета обучения и идентификатор предмета.*/
Select SEMESTR, SUBJ_NAME, SUBJ_ID From SUBJECT Order By SEMESTR;
Select SEMESTR, SUBJ_NAME, SUBJ_ID From SUBJECT Order By KHOUR;
/*16. Напишите запрос, который выполняет вывод суммы баллов всех студентов для каждой 
даты сдачи экзаменов и представляет результаты в порядке убывания этих сумм.*/
select SUM(mark) as mark_sum, exam_date from EXAM_MARKS group by EXAM_DATE order by mark_sum desc;
/*17. Напишите запрос, который выполняет вывод а) среднего, б) минимального,
в) максимального баллов всех студентов для каждой да¬ты сдачи экзаменов 
и который представляет результаты в порядке убывания этих значений.*/
select AVG(mark) as avg_mark, EXAM_DATE from EXAM_MARKS group by exam_date
select min(mark) as min_mark, EXAM_DATE from EXAM_MARKS group by exam_date
select max(mark) as max_mark, EXAM_DATE from EXAM_MARKS group by exam_date