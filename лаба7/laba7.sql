/*Лабораторная работа  7*/
--Создать SQL-запрос на создание новой базы данных SSPP на Microsoft SQL Server: 
CREATE DATABASE sspp
--Создать SQL-запрос Create_s на создание в базе данных структуры таблицы S (справочника поставщиков):
CREATE  TABLE s (s_no CHAR(4) NOT NULL, 
sname 	VARCHAR(20) NOT NULL,
status NUMERIC, 
city VARCHAR(20))
--Аналогичным образом создать SQL-запрос Create_p на создание в базе данных структуры таблицы P (справочника товаров) и создать таблицу:
CREATE TABLE p (p_no CHAR(4) NOT NULL,
pname VARCHAR(20) NOT NULL,
color VARCHAR(10), 
weight NUMERIC, 
city VARCHAR(20))
--Аналогичным образом создать SQL-запрос Create_sp на создание в базе данных структуры таблицы SP (сведений о поставках конкретных товаров конкретными поставщиками) и создать таблицу:
CREATE TABLE sp(s_no CHAR(4) NOT NULL, 
p_no CHAR(4) NOT NULL, 
qty NUMERIC)
--Создать SQL-запрос Alter_s на модификацию структуры таблицы S — ввести ограничение первичного ключа с именем PK_s_no по полю s_no — и модифицировать таблицу
ALTER TABLE s ADD CONSTRAINT PK_s_no PRIMARY KEY (s_no)
--Аналогичным образом создать SQL-запрос Alter_p на модификацию структуры таблицы P — ввести ограничение первичного ключа с именем PK_p_no по полю p_no — и модифицировать таблицу:
ALTER TABLE p ADD CONSTRAINT PK_p_no PRIMARY KEY (p_no) 
--Аналогичным образом создать SQL-запрос Alter_sp на модификацию структуры таблицы SP — ввести ограничение первичного ключа с именем PK_s_no_p_no по полям s_no и p_no, ограничение внешнего ключа FK_s_no  по полю s_no для родительской таблицы s, ограничение внешнего ключа FK_p_no  по полю p_no для родительской таблицы p — и модифицировать таблицу:
ALTER TABLE sp ADD 
CONSTRAINT PK_s_no_p_no PRIMARY KEY (s_no, p_no),
CONSTRAINT FK_s_no FOREIGN KEY (s_no) REFERENCES s,
CONSTRAINT FK_p_no FOREIGN KEY (p_no) REFERENCES p
--Создать SQL-запрос Insert_s на ввод 5 строк в таблицу S и заполнить ее:
INSERT INTO s VALUES ('s1', 'Smith', 20, 'London')
INSERT INTO s VALUES ('s2', 'Jones', 10, 'Paris')
INSERT INTO s VALUES ('s3', 'Blake', 30, 'Paris')
INSERT INTO s VALUES ('s4', 'Clark', 20, 'London')
INSERT INTO s VALUES ('s5', 'Adams', 30, 'Athens')
--Аналогичным образом создать SQL-запрос Insert_p на ввод 6 строк в таблицу P и заполнить ее:
INSERT INTO p VALUES ('p1', 'Nut',   'Red',   12, 'London')
INSERT INTO p VALUES ('p2', 'Bolt',  'Green', 17, 'Paris')
INSERT INTO p VALUES ('p3', 'Screw', 'Blue',  17, 'Rome')
INSERT INTO p VALUES ('p4', 'Screw', 'Red',   14, 'London')
INSERT INTO p VALUES ('p5', 'Cam',   'Blue',  12, 'Paris')
INSERT INTO p VALUES ('p6', 'Cog',   'Red',   19, 'London')
--Аналогичным образом создать SQL-запрос Insert_p на ввод 12 строк в таблицу SP и заполнить ее:
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
--Создать SQL-запрос Select_1a на извлечение данных из базы — «О поставщиках из Афин и Лондона, упорядоченных по статусу, а для одинакового статуса — по именам, используя:  а) логическую функцию»  — и извлечь данные:
SELECT * FROM s WHERE city='Athens' OR city='London' ORDER BY status, sname
--Аналогичным образом создать SQL-запросы Select_1b…Select12 на извлечение следующих данных из базы и извлечь данные:
--1)О поставщиках из Афин и Лондона, упорядоченных по статусу, а для одинакового статуса — по именам, используя:  
--б) 	операцию IN:
   SELECT * FROM s WHERE city IN ('Athens','London') ORDER BY status, sname
--2)	О товарах: коды, имена, вес в килограммах:
SELECT p_no, pname, weight*0.001 AS kg FROM p
--3)	Коды поставщиков, поставляющих какие-либо товары (без дубликатов):
SELECT DISTINCT s_no FROM sp
--4)	О поставщиках, в именах или названиях городов которых есть сочетание букв «th»:
SELECT * FROM s WHERE sname LIKE '%th%' OR city LIKE '%th%';
--5)	О поставщиках со статусом от 20 до 30 (использовать BETWEEN):
SELECT * FROM s WHERE status BETWEEN 20 AND 30
--6)	О поставках с указанием кодов и имен поставщиков, кодов и имен товаров, количества товаров в поставке, используя для соединения таблиц: 
	--а)	условие WHERE:
SELECT s.s_no,s.sname, p.p_no, p.pname, sp.qty FROM s, sp, p
WHERE s.s_no=sp.s_no AND sp.p_no=p.p_no
	--б)	оператор JOIN:
SELECT s.s_no, s.sname, p.p_no, p.pname, sp.qty 
FROM (s INNER JOIN sp ON s.s_no=sp.s_no) INNER JOIN p ON sp.p_no=p.p_no
--7)	О поставщиках хотя бы одного товара красного цвета, используя:
	--а)	вложенные запросы:
SELECT * FROM s WHERE s_no IN (
  SELECT s_no FROM sp WHERE p_no IN (
    SELECT p_no FROM p WHERE color = 'Red'))
	--б)	соединение таблиц:
SELECT DISTINCT s.* FROM s,sp,p 
WHERE s.s_no=sp.s_no AND sp.p_no=p.p_no AND p.color='Red'
--8)	О поставщиках хотя бы одного товара, поставляемого поставщиком ‘s2’, используя:
	--а)	вложенные запросы:
SELECT * FROM s WHERE s_no <> 's2' AND s_no IN (
  SELECT s_no FROM sp WHERE p_no IN (
    SELECT p_no FROM sp WHERE s_no = 's2'))
	--б)	соединение таблиц:
SELECT DISTINCT s.* FROM s, sp spx, sp spy
WHERE s.s_no<>'s2' AND s.s_no=spx.s_no AND spx.p_no=spy.p_no AND spy.s_no='s2'
--9)	О поставщиках, не поставляющих товары:
SELECT * FROM s WHERE s_no NOT IN (SELECT s_no FROM sp)
--10)	Коды и имена поставщиков, общее количество поставляемых поставщиком товаров sum_p, общее количество поставок поставщика kol_p, минимальное min_p, максимальное max_p и среднее sredn_p количество товаров в партиях поставщика, упорядоченные по общему количеству поставляемых товаров:
	--а)	для поставщиков, поставляющих товары:
SELECT s.s_no, s.sname, SUM(qty) AS sum_p, COUNT(*) AS kol_p,
       MIN(qty) AS min_p, MAX(qty) AS max_p, AVG(qty) AS sredn_p
FROM s INNER JOIN sp ON s.s_no=sp.s_no GROUP BY s.s_no, s.sname ORDER BY sname
	--б)	для всех поставщиков (использовать внешнее соединение таблиц):
SELECT s.s_no, s.sname, SUM(qty) AS sum_p, COUNT(*) AS kol_p,
       MIN(qty) AS min_p, MAX(qty) AS max_p, AVG(qty) AS sredn_p
FROM s LEFT JOIN sp ON s.s_no=sp.s_no GROUP BY s.s_no, s.sname 
ORDER BY SUM(qty) DESC
	--в)	для всех поставщиков (использовать объединение таблиц):
SELECT s.s_no, s.sname, SUM(qty) AS sum_p, COUNT(*) AS kol_p,
       MIN(qty) AS min_p, MAX(qty) AS max_p, AVG(qty) AS sredn_p
FROM s INNER JOIN sp ON s.s_no=sp.s_no GROUP BY s.s_no, s.sname
UNION
SELECT s_no, sname, 0 AS sum_p, 0 AS kol_p, 0 AS min_p, 0 AS max_p, 0 AS sredn_p
FROM s WHERE status>10 AND s_no NOT IN (SELECT s_no FROM sp)
ORDER BY sname
--11)	О поставщиках всех товаров:
SELECT * FROM s WHERE NOT EXISTS (
  SELECT * FROM p WHERE p_no NOT IN (
    SELECT p_no FROM sp WHERE s.s_no=sp.s_no AND sp.p_no=p.p_no))
--12)	О поставщиках по крайней мере тех товаров, которые поставляет поставщик ‘s2’:
SELECT * FROM s WHERE s_no <> 's2' AND NOT EXISTS (
  SELECT * FROM sp WHERE s_no='s2' AND p_no NOT IN (
    SELECT p_no FROM sp WHERE s.s_no=sp.s_no))




