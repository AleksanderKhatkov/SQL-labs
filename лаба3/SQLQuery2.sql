/* ������������ ������ 3*/

--1�������� ������ ��� �������� ���������� ���������, ��������� ������� �� �������� �������� � ���������������, ������ 22.
SELECT COUNT(STUDENT_ID) FROM EXAM_MARKS WHERE SUBJ_ID =22 --1
--2�������� ������ ��� �������� � ������� EXAM_MARKS ���-�� ��������� ��������� ��������.
SELECT COUNT(DISTINCT (STUDENT_ID)) FROM EXAM_MARKS;
--3�������� ������, ������� ��������� ������� ��� ������� �������� �������� ��� �������������� � ����������� �� ���������� �� ������.
SELECT STUDENT_ID, MIN(MARK) FROM EXAM_MARKS GROUP BY STUDENT_ID
--4�������� ������, �������������� ������� ��� ������� �������� �������� ��� �������������� � ������������ �� ���������� �� ������.
SELECT STUDENT_ID, MAX(MARK) FROM EXAM_MARKS GROUP BY STUDENT_ID
--5�������� ������, ����������� ����� ������� ������� � ���������� ������� (�� �������) ��������, ������� �������� ���������� �� ����� �Ȼ.
SELECT SURNAME FROM STUDENT WHERE SURNAME LIKE '�%';
--6�������� ������, ������� ��������� ����� (��� ������� �������� ��������) ������������ �������� � ������������� �������� ������ ��������, � ������� ���� ������� �����������.
SELECT SUBJ_NAME, MAX(SEMESTR) AS SEMESTR FROM SUBJECT GROUP BY SUBJ_NAME;
--7�������� ������, ������� ��������� ����� ������ ��� ������� ����������� ��� ����� �������� � ���������� ���������, ��������� ������� � ���� ����.
--SELECT STUDENT_ID, SUBJ_ID, COUNT(STUDENT_ID) FROM EXAM_MARKS GROUP BY EXAM_DATE

--SELECT AVG(MARK) AS AVERGE_MARK, SUBJ_ID FROM EXAM_MARKS GROUP BY STUDENT_ID;--7

--SELECT COUNT(SUBJ_ID) AS SUBJ_C, (1+SEMESTR)/2 AS COUNTS FROM SUBJECT group by; --8


