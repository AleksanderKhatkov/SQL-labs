/* ������������ ������ 3*/

--1.�������� ������ ��� �������� ���������� ���������, ��������� ������� �� �������� �������� � ���������������, ������ 22.
SELECT COUNT(STUDENT_ID) FROM EXAM_MARKS WHERE SUBJ_ID =22;
--2.�������� ������ ��� �������� � ������� EXAM_MARKS ���-�� ��������� ��������� ��������.
SELECT COUNT(DISTINCT (STUDENT_ID)) FROM EXAM_MARKS;
--3.�������� ������, ������� ��������� ������� ��� ������� �������� �������� ��� �������������� � ����������� �� ���������� �� ������.
SELECT STUDENT_ID, MIN(MARK) FROM EXAM_MARKS GROUP BY STUDENT_ID;
--4.�������� ������, �������������� ������� ��� ������� �������� �������� ��� �������������� � ������������ �� ���������� �� ������.
SELECT STUDENT_ID, MAX(MARK) FROM EXAM_MARKS GROUP BY STUDENT_ID;
--5.�������� ������, ����������� ����� ������� ������� � ���������� ������� (�� �������) ��������, ������� �������� ���������� �� ����� �Ȼ.
SELECT SURNAME FROM STUDENT WHERE SURNAME LIKE '�%';
--6.�������� ������, ������� ��������� ����� (��� ������� �������� ��������) ������������ �������� � ������������� �������� ������ ��������, � ������� ���� ������� �����������.
SELECT SUBJ_NAME, MAX(SEMESTR) AS SEMESTR FROM SUBJECT GROUP BY SUBJ_NAME;
--7.�������� ������, ������� ��������� ����� ������ ��� ������� ����������� ��� ����� �������� � ���������� ���������, ��������� ������� � ���� ����.
select EXAM_DATE, count(STUDENT_ID) as st_count from EXAM_MARKS group by EXAM_DATE;
--8.�������� ������ ��� ��������� �������� ����� ��� ������� ����� �� ������� ��������.
select AVG(MARK) as subj_mark, SUBJ_ID from EXAM_MARKS group by SUBJ_ID;
--9.�������� ������ ��� ��������� �������� ����� ��� ������� ��������.
select AVG(MARK) as student_mark, STUDENT_ID from EXAM_MARKS group by STUDENT_ID;
--10.�������� ������ ��� ��������� �������� ����� ��� ������� ��������.
Select AVG(MARK) as exam_mark, EXAM_ID From EXAM_MARKS group by EXAM_ID;
--11.�������� ������ ��� ����������� ���������� ���������, ��������� ������ �������
Select COUNT(STUDENT_ID) as student_count, EXAM_ID From EXAM_MARKS  Where mark is not null Group By EXAM_ID;
--12.�������� ������ ��� ����������� ���������� ��������� ��������� �� ������ �����
Select COUNT(SUBJ_ID) as subjectid, ((SEMESTR +1)/2) as KURS_NUMBER FROM SUBJECT Group BY ((SEMESTR + 1) / 2);
/*13.�����������, ��� ��������� ���� ��������� ��������� �� 20%. �������� ������ � ������� STUDENT, 
����������� ����� ������ ��������, ������� �������� � �������� ����������� ���������. 
�������� ������ �����������: �) �� �������� ���������� ������� (�������� ���������); �) 
� ���������� ������� ������� ���������.*/
Select STUDENT_ID, SURNAME, STIPEND*1.2 as stipend from STUDENT order by stipend;
select STUDENT_ID, SURNAME, STIPEND*1.2 as stipend from STUDENT order by SURNAME;
/*14.�������� ������, ������� �� ������� EXAM_MARKS ��������� ����� �)
������������ � �) ����������� ������ ������� �������� � ������� ������� �� ������ � ��������������� ��������*/
Select STUDENT_ID, max(MARK) as mark_max, min(MARK) as mark_min  From EXAM_MARKS Group by STUDENT_ID;
/*15. �������� ������, ����������� ����� ������ ��������� �������� � ������� 
�) �������� ��������� � �) ����������� ��������� �� ������� �����. ���� �������� � �������� ������ 
������ ���� ������, �� ��� ������ ��������� ��� �������� �������� � ������������� ��������.*/
Select SEMESTR, SUBJ_NAME, SUBJ_ID From SUBJECT Order By SEMESTR;
Select SEMESTR, SUBJ_NAME, SUBJ_ID From SUBJECT Order By KHOUR;
/*16. �������� ������, ������� ��������� ����� ����� ������ ���� ��������� ��� ������ 
���� ����� ��������� � ������������ ���������� � ������� �������� ���� ����.*/
select SUM(mark) as mark_sum, exam_date from EXAM_MARKS group by EXAM_DATE order by mark_sum desc;
/*17. �������� ������, ������� ��������� ����� �) ��������, �) ������������,
�) ������������� ������ ���� ��������� ��� ������ ���� ����� ��������� 
� ������� ������������ ���������� � ������� �������� ���� ��������.*/
select AVG(mark) as avg_mark, EXAM_DATE from EXAM_MARKS group by exam_date
select min(mark) as min_mark, EXAM_DATE from EXAM_MARKS group by exam_date
select max(mark) as max_mark, EXAM_DATE from EXAM_MARKS group by exam_date