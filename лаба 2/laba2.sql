/*������������ ������ � 2*/

/*1 ��������� ������ ��� ������� STUDENT ����� �������, ����� ��������� ������� ��������� ���� �������, 
���������� ���������-��������� ����������� �������� 
�;� (����� � �������) �������� �������� STUDENT_ID, SURNAME, FNAME, STIPEND, KURS ���� �������, 
� ��� ���� ��������� �������� ������ ������������ ���������� ��������� (������� �������)*/

SELECT (RTRIM(STUDENT_ID))+ ' ; '+ UPPER(SURNAME)+ ' ; '+ UPPER(FNAME) + ' ; ' + UPPER(RTRIM(STIPEND) + ' ; ' +UPPER(KURS)) 
AS STUDSUAAMND FROM STUDENT; 
/*2 ��������� ������ ��� ������� STUDENT ����� �������, ����� ��������� ������� ��������� ����� ���� ������� � ��������� SVEDENIYA � ��������� ����: 
�.��������;���������������-������;�������-8/12/81. ��� ���� ���������, ������� ��������� �������� �������� CITY, BIRTHDAY.*/
SELECT  LEFT (FNAME, 1) + ' ; ' + UPPER(SURNAME) + ' ; ' +'��������������� - ' +  UPPER(RTRIM (CITY)) + ' ; ' + '������� - ' + CONVERT(nvarchar(10), BIRTHDAY, 104) AS SVEDENIYA
FROM STUDENT WHERE CITY IS NOT NULL;
/*3 ��������� ������ ��� ������� STUDENT ����� �������, ����� ��������� ������� ��������� ����� ���� ������� � ��������� ����: ����� �������� ������� � 1981 ����. ��� ���� ��������� 1,2 � 4  ������.*/
SELECT  UPPER (FNAME) + ' ; ' + UPPER(SURNAME) + ' ; '  + '������� - ' + CONVERT(nvarchar(10), BIRTHDAY, 104) AS SVEDENIYA
FROM STUDENT WHERE KURS ='1' OR KURS ='2' OR  KURS ='4'; 
/*4 ������� �������, ����� ��������� � �������� ���������� ��� ���������, ��� ���� �������� ��������� ������ ���� ��������� � 100 ���.*/
SELECT FNAME,SURNAME,(STIPEND*100) AS SUMM  FROM STUDENT; 






