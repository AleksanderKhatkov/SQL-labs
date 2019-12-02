/*Лабораторная работа № 2*/

/*1 Составьте запрос для таблицы STUDENT таким образом, чтобы вы¬ходная таблица содержала один столбец, 
содержащий последова-тельность разделенных символом 
«;» (точка с запятой) значений столбцов STUDENT_ID, SURNAME, FNAME, STIPEND, KURS этой таблицы, 
и при этом текстовые значения должны отображаться прописными символами (верхний регистр)*/

SELECT (RTRIM(STUDENT_ID))+ ' ; '+ UPPER(SURNAME)+ ' ; '+ UPPER(FNAME) + ' ; ' + UPPER(RTRIM(STIPEND) + ' ; ' +UPPER(KURS)) 
AS STUDSUAAMND FROM STUDENT; 
/*2 Составьте запрос для таблицы STUDENT таким образом, чтобы вы¬ходная таблица содержала всего один столбец с названием SVEDENIYA в следующем виде: 
Б.КУЗНЕЦОВ;местожительства-БРЯНСК;родился-8/12/81. Для всех студентов, имеющих ненулевые значения столбцов CITY, BIRTHDAY.*/
SELECT  LEFT (FNAME, 1) + ' ; ' + UPPER(SURNAME) + ' ; ' +'местожительства - ' +  UPPER(RTRIM (CITY)) + ' ; ' + 'родился - ' + CONVERT(nvarchar(10), BIRTHDAY, 104) AS SVEDENIYA
FROM STUDENT WHERE CITY IS NOT NULL;
/*3 Составьте запрос для таблицы STUDENT таким образом, чтобы вы¬ходная таблица содержала всего один столбец в следующем виде: Борис Кузнецов родился в 1981 году. Для всех студентов 1,2 и 4  курсов.*/
SELECT  UPPER (FNAME) + ' ; ' + UPPER(SURNAME) + ' ; '  + 'родился - ' + CONVERT(nvarchar(10), BIRTHDAY, 104) AS SVEDENIYA
FROM STUDENT WHERE KURS ='1' OR KURS ='2' OR  KURS ='4'; 
/*4 Вывести фамилии, имена студентов и величину получаемых ими стипендий, при этом значения стипендий должны быть увеличены в 100 раз.*/
SELECT FNAME,SURNAME,(STIPEND*100) AS SUMM  FROM STUDENT; 






