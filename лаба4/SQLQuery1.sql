/*������������ ������ � 4*/

--1�������� ������ � ����������� ��� ��������� ������ ��� ���� ������� �������� � �������� �������. �����������, ��� ��� ������������ ����� ����������. 
SELECT * FROM EXAM_MARKS WHERE STUDENT_ID=(SELECT STUDENT_ID FROM STUDENT where SURNAME='�������' and FNAME='�����' )
--2�������� ������, ���������� ������ �� ������ ���� ���������, ������� �� �������� � ��������������� 22 ���� ���� ������ �������� �����
SELECT FNAME FROM STUDENT, EXAM_MARKS WHERE MARK>=(SELECT AVG(MARK) FROM EXAM_MARKS) AND SUBJ_ID=22 AND STUDENT.STUDENT_ID=EXAM_MARKS.STUDENT_ID
--3�������� ������, ������� ��������� ������� ���� ���� ���������, ������� �� �������� � ��������������� 22 ���� ���� ������ �������� �����.
SELECT COUNT(DISTINCT STUDENT_ID), AVG(MARK) FROM EXAM_MARKS GROUP BY MARK HAVING MARK >(SELECT AVG(MARK) FROM EXAM_MARKS WHERE STUDENT_ID=12)
 --4�������� ������, ����������� ����� ���������� ���������, �� ������� ������������� ������ �������, ��������� ����� 3 ���������.
SELECT STUDENT_ID, COUNT(SUBJ_ID)  FROM EXAM_MARKS  GROUP BY STUDENT_ID HAVING COUNT(SUBJ_ID)=2
--5�������� ������� SELECT, ������������ ��������� ���������� � ����������� ����� ���� � ��������������� ���������, � ������� ��������� ��������� � ������������ ��������� ��������� ��� ������, � ������� ����� �������.
select fname from student A where STIPEND=(select max(STIPEND) from STUDENT where A.CITY=CITY)
--�������� ������, ������� ��������� ������� ����� � �������������� ���� ���������, ��� ������� ����� ��������, ��� ��� ��������� � ������, ��� ��� �� ������ ������������.
select FNAME FROM STUDENT A WHERE CITY NOT IN (SELECT CITY FROM UNIVERSITY)





