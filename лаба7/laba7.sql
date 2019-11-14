/*������������ ������  7*/
--������� SQL-������ �� �������� ����� ���� ������ SSPP �� Microsoft SQL Server: 
CREATE DATABASE sspp
--������� SQL-������ Create_s �� �������� � ���� ������ ��������� ������� S (����������� �����������):
CREATE  TABLE s (s_no CHAR(4) NOT NULL, 
sname 	VARCHAR(20) NOT NULL,
status NUMERIC, 
city VARCHAR(20))
--����������� ������� ������� SQL-������ Create_p �� �������� � ���� ������ ��������� ������� P (����������� �������) � ������� �������:
CREATE TABLE p (p_no CHAR(4) NOT NULL,
pname VARCHAR(20) NOT NULL,
color VARCHAR(10), 
weight NUMERIC, 
city VARCHAR(20))
--����������� ������� ������� SQL-������ Create_sp �� �������� � ���� ������ ��������� ������� SP (�������� � ��������� ���������� ������� ����������� ������������) � ������� �������:
CREATE TABLE sp(s_no CHAR(4) NOT NULL, 
p_no CHAR(4) NOT NULL, 
qty NUMERIC)
--������� SQL-������ Alter_s �� ����������� ��������� ������� S � ������ ����������� ���������� ����� � ������ PK_s_no �� ���� s_no � � �������������� �������
ALTER TABLE s ADD CONSTRAINT PK_s_no PRIMARY KEY (s_no)
--����������� ������� ������� SQL-������ Alter_p �� ����������� ��������� ������� P � ������ ����������� ���������� ����� � ������ PK_p_no �� ���� p_no � � �������������� �������:
ALTER TABLE p ADD CONSTRAINT PK_p_no PRIMARY KEY (p_no) 
--����������� ������� ������� SQL-������ Alter_sp �� ����������� ��������� ������� SP � ������ ����������� ���������� ����� � ������ PK_s_no_p_no �� ����� s_no � p_no, ����������� �������� ����� FK_s_no  �� ���� s_no ��� ������������ ������� s, ����������� �������� ����� FK_p_no  �� ���� p_no ��� ������������ ������� p � � �������������� �������:
ALTER TABLE sp ADD 
CONSTRAINT PK_s_no_p_no PRIMARY KEY (s_no, p_no),
CONSTRAINT FK_s_no FOREIGN KEY (s_no) REFERENCES s,
CONSTRAINT FK_p_no FOREIGN KEY (p_no) REFERENCES p
--������� SQL-������ Insert_s �� ���� 5 ����� � ������� S � ��������� ��:
INSERT INTO s VALUES ('s1', 'Smith', 20, 'London')
INSERT INTO s VALUES ('s2', 'Jones', 10, 'Paris')
INSERT INTO s VALUES ('s3', 'Blake', 30, 'Paris')
INSERT INTO s VALUES ('s4', 'Clark', 20, 'London')
INSERT INTO s VALUES ('s5', 'Adams', 30, 'Athens')
--����������� ������� ������� SQL-������ Insert_p �� ���� 6 ����� � ������� P � ��������� ��:
INSERT INTO p VALUES ('p1', 'Nut',   'Red',   12, 'London')
INSERT INTO p VALUES ('p2', 'Bolt',  'Green', 17, 'Paris')
INSERT INTO p VALUES ('p3', 'Screw', 'Blue',  17, 'Rome')
INSERT INTO p VALUES ('p4', 'Screw', 'Red',   14, 'London')
INSERT INTO p VALUES ('p5', 'Cam',   'Blue',  12, 'Paris')
INSERT INTO p VALUES ('p6', 'Cog',   'Red',   19, 'London')
--����������� ������� ������� SQL-������ Insert_p �� ���� 12 ����� � ������� SP � ��������� ��:
INSERT INTO sp VALUES ('s1', 'p1', 300)
INSERT INTO sp VALUES ('s1', 'p2', 200)
INSERT INTO sp VALUES ('s1', 'p3', 400)
INSERT INTO sp VALUES ('s1', 'p4', 200)
INSERT INTO sp VALUES ('s1', 'p5', 100)
INSERT INTO sp VALUES ('s1', 'p6', 100)
INSERT INTO sp VALUES ('s2', 'p1', 300)
INSERT INTO sp VALUES ('s2', 'p2', 400)
INSERT INTO sp VALUES ('s3', 'p2', 200)
INSERT INTO sp VALUES ('s4', 'p2', 200)
INSERT INTO sp VALUES ('s4', 'p4', 300)
INSERT INTO sp VALUES ('s4', 'p5', 400)
--������� SQL-������ Select_1a �� ���������� ������ �� ���� � �� ����������� �� ���� � �������, ������������� �� �������, � ��� ����������� ������� � �� ������, ���������:  �) ���������� ��������  � � ������� ������:
SELECT * FROM s WHERE city='Athens' OR city='London' ORDER BY status, sname
--����������� ������� ������� SQL-������� Select_1b�Select12 �� ���������� ��������� ������ �� ���� � ������� ������:
--1)� ����������� �� ���� � �������, ������������� �� �������, � ��� ����������� ������� � �� ������, ���������:  
--�) 	�������� IN:
   SELECT * FROM s WHERE city IN ('Athens','London') ORDER BY status, sname
--2)	� �������: ����, �����, ��� � �����������:
SELECT p_no, pname, weight*0.001 AS kg FROM p
--3)	���� �����������, ������������ �����-���� ������ (��� ����������):
SELECT DISTINCT s_no FROM sp
--4)	� �����������, � ������ ��� ��������� ������� ������� ���� ��������� ���� �th�:
SELECT * FROM s WHERE sname LIKE '%th%' OR city LIKE '%th%';
--5)	� ����������� �� �������� �� 20 �� 30 (������������ BETWEEN):
SELECT * FROM s WHERE status BETWEEN 20 AND 30
--6)	� ��������� � ��������� ����� � ���� �����������, ����� � ���� �������, ���������� ������� � ��������, ��������� ��� ���������� ������: 
	--�)	������� WHERE:
SELECT s.s_no,s.sname, p.p_no, p.pname, sp.qty FROM s, sp, p
WHERE s.s_no=sp.s_no AND sp.p_no=p.p_no
	--�)	�������� JOIN:
SELECT s.s_no, s.sname, p.p_no, p.pname, sp.qty 
FROM (s INNER JOIN sp ON s.s_no=sp.s_no) INNER JOIN p ON sp.p_no=p.p_no
--7)	� ����������� ���� �� ������ ������ �������� �����, ���������:
	--�)	��������� �������:
SELECT * FROM s WHERE s_no IN (
  SELECT s_no FROM sp WHERE p_no IN (
    SELECT p_no FROM p WHERE color = 'Red'))
	--�)	���������� ������:
SELECT DISTINCT s.* FROM s,sp,p 
WHERE s.s_no=sp.s_no AND sp.p_no=p.p_no AND p.color='Red'
--8)	� ����������� ���� �� ������ ������, ������������� ����������� �s2�, ���������:
	--�)	��������� �������:
SELECT * FROM s WHERE s_no <> 's2' AND s_no IN (
  SELECT s_no FROM sp WHERE p_no IN (
    SELECT p_no FROM sp WHERE s_no = 's2'))
	--�)	���������� ������:
SELECT DISTINCT s.* FROM s, sp spx, sp spy
WHERE s.s_no<>'s2' AND s.s_no=spx.s_no AND spx.p_no=spy.p_no AND spy.s_no='s2'
--9)	� �����������, �� ������������ ������:
SELECT * FROM s WHERE s_no NOT IN (SELECT s_no FROM sp)
--10)	���� � ����� �����������, ����� ���������� ������������ ����������� ������� sum_p, ����� ���������� �������� ���������� kol_p, ����������� min_p, ������������ max_p � ������� sredn_p ���������� ������� � ������� ����������, ������������� �� ������ ���������� ������������ �������:
	--�)	��� �����������, ������������ ������:
SELECT s.s_no, s.sname, SUM(qty) AS sum_p, COUNT(*) AS kol_p,
       MIN(qty) AS min_p, MAX(qty) AS max_p, AVG(qty) AS sredn_p
FROM s INNER JOIN sp ON s.s_no=sp.s_no GROUP BY s.s_no, s.sname ORDER BY sname
	--�)	��� ���� ����������� (������������ ������� ���������� ������):
SELECT s.s_no, s.sname, SUM(qty) AS sum_p, COUNT(*) AS kol_p,
       MIN(qty) AS min_p, MAX(qty) AS max_p, AVG(qty) AS sredn_p
FROM s LEFT JOIN sp ON s.s_no=sp.s_no GROUP BY s.s_no, s.sname 
ORDER BY SUM(qty) DESC
	--�)	��� ���� ����������� (������������ ����������� ������):
SELECT s.s_no, s.sname, SUM(qty) AS sum_p, COUNT(*) AS kol_p,
       MIN(qty) AS min_p, MAX(qty) AS max_p, AVG(qty) AS sredn_p
FROM s INNER JOIN sp ON s.s_no=sp.s_no GROUP BY s.s_no, s.sname
UNION
SELECT s_no, sname, 0 AS sum_p, 0 AS kol_p, 0 AS min_p, 0 AS max_p, 0 AS sredn_p
FROM s WHERE status>10 AND s_no NOT IN (SELECT s_no FROM sp)
ORDER BY sname
--11)	� ����������� ���� �������:
SELECT * FROM s WHERE NOT EXISTS (
  SELECT * FROM p WHERE p_no NOT IN (
    SELECT p_no FROM sp WHERE s.s_no=sp.s_no AND sp.p_no=p.p_no))
--12)	� ����������� �� ������� ���� ��� �������, ������� ���������� ��������� �s2�:
SELECT * FROM s WHERE s_no <> 's2' AND NOT EXISTS (
  SELECT * FROM sp WHERE s_no='s2' AND p_no NOT IN (
    SELECT p_no FROM sp WHERE s.s_no=sp.s_no))




