/*Практическая работа №1*/

/*1.Напишите запрос для вывода идентификатора (номера) предмета обучения, его наименования, семестра, в котором он читается, и количества отводимых на этот предмет часов для всех строк таб¬лицы SUBJECT.*/
SELECT SUBJ_ID, SUBJ_NAME,KHOUR,SEMESTR FROM SUBJECT;
/*2.Напишите запрос,  позволяющий  вывести все строки таблицы exam_marks, в которых предмет обучения имеет номер (subj_id), равный 22.*/
SELECT*FROM EXAM_MARKS WHERE subj_id ='22'; 
/*3.Напишите запрос, выбирающий все данные из таблицы student, расположив столбцы таблицы в следующем порядке: kurs, surname, fname.*/
SELECT KURS,SURNAME,fname FROM STUDENT;
/*4.Напишите запрос select, который выводит наименование предмета обучения (sub j_name) и количество часов (HOUR) для каждого предмета (SUBJECT) в 4-м семестре (SEMESTR).*/
SELECT SUBJ_NAME,KHOUR FROM SUBJECT WHERE SEMESTR = 4; 
/*5.Напишите запрос, позволяющий получить из таблицы EXAM_MARKS значения столбца MARK (экзаменационная оценка) для всех студентов, исключив из списка повторение одинаковых строк. Напишите запрос, который выводит список фамилий студентов, обучающихся на третьем и последующих курсах.*/
select surname,fname,kurs from STUDENT Where kurs >=3;
/*6.Напишите запрос, выбирающий данные о фамилии, имени и номеру курса для студентов, получающих стипендию больше 140.*/
SELECT *FROM STUDENT WHERE STIPEND >140;
/*7.Напишите запрос, выполняющий выборку из таблицы SUBJECT названий всех предметов обучения, на которые отводится более 30 часов.*/
SELECT *FROM SUBJECT WHERE KHOUR > 30; 
/*8.Напишите запрос, который выполняет вывод списка университетов, рейтинг которых превышает 300 баллов.*/
SELECT UNIV_NAME, RAITING FROM UNIVERSITY WHERE RAITING > 300;
SELECT SURNAME, FNAME,KURS FROM STUDENT WHERE STIPEND >=100 AND CITY='Ворониж'; 
/*10.Какие данные будут получены в результате выполнения запросов?*/
select * from student where stipend < 100 or STUDENT_ID > 100
select * from STUDENT where not (BIRTHDAY='5/11/1979' or STIPEND < 100) and STUDENT_ID < 12
/*11.Напишите запрос на вывод находящихся в таблице exam_marks номеров предметов обучения, экзамены по которым сдавались ме¬жду 10 и 20 января 1999 года.*/
SELECT* FROM exam_marks WHERE CONVERT (date,exam_date,104)BETWEEN  convert (date, '10.01.1991',104) and convert (date, '20.01.2000',104)
/*12.Напишите запрос, выбирающий данные обо всех предметах обучения, экзамены по которым сданы студентами, имеющими иденти¬фикаторы 12 и 32.*/
select SUBJ_ID from EXAM_MARKS where (student_id = 12 or student_id= 32) and MARK is not null and MARK>=3; 
/*13.Напишите запрос на вывод названий предметов обучения, начина¬ющихся на букву «И».*/
Select subj_id from SUBJECT where subj_name like 'И%';
/*14.	Напишите запрос, выбирающий сведения о студентах, у которых имена начинаются на буквы «И» или «С».*/
Select STUDENT_ID from STUDENT where FNAME like 'И%' or fname like 'С%'; 
/*15.Напишите запрос для выбора из таблицы exam_marks записей, в которых отсутствуют значения оценок (поле MARK).*/
select *from EXAM_MARKS where  mark is not null;
/*16.Напишите запрос на вывод из таблицы exam_marks записей, име¬ющих в поле mark значения оценок.*/
select * from EXAM_MARKS where MARK is not null
