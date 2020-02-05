/*Лабораторная работа 8*/

CREATE DATABASE products

CREATE TABLE S
(
S_no CHAR(6) PRIMARY KEY NOT NULL,
Surname VARCHAR(20),
Rating INT NOT NULL,
City VARCHAR(20))

go
INSERT INTO s VALUES ('s1', 'Smith', 20, 'London')
INSERT INTO s VALUES ('s2', 'Jones', 10, 'Paris')
INSERT INTO s VALUES ('s3', 'Blake', 30, 'Paris')
INSERT INTO s VALUES ('s4', 'Clark', 20, 'London')
INSERT INTO s VALUES ('s5', 'Adams', 30, 'Athens')
go


CREATE TABLE P(
P_no CHAR(6) PRIMARY KEY NOT NULL,
Title VARCHAR(20),
Color VARCHAR(10),
Weight NUMERIC NOT NULL,
City VARCHAR(20))
go
INSERT INTO p VALUES ('p1', 'Nut',   'Red',   12, 'London')
INSERT INTO p VALUES ('p2', 'Bolt',  'Green', 17, 'Paris')
INSERT INTO p VALUES ('p3', 'Screw', 'Blue',  17, 'Rome')
INSERT INTO p VALUES ('p4', 'Screw', 'Red',   14, 'London')
INSERT INTO p VALUES ('p5', 'Cam',   'Blue',  12, 'Paris')
INSERT INTO p VALUES ('p6', 'Cog',   'Red',   19, 'London')
go


CREATE TABLE J
(
J_no CHAR(6) PRIMARY KEY NOT NULL,
Name VARCHAR(20) NOT NULL,
City VARCHAR(20))

go
INSERT INTO j VALUES ('j1', 'Hard Drive', 'Paris')
INSERT INTO j VALUES ('j2', 'Rotary Hammer', 'Rome')
INSERT INTO j VALUES ('j3', 'Reader', 'Athens')
INSERT INTO j VALUES ('j4', 'Printer', 'Athens')
INSERT INTO j VALUES ('j5', 'Floppy disk', 'london')
INSERT INTO j VALUES ('j6', 'Terminal', 'Oslo')
INSERT INTO j VALUES ('j7', 'Tape', 'London')
go



CREATE TABLE SPJ
(
S CHAR(6) references S(S_no),
P CHAR(6) references P(P_no),
J CHAR(6) references J(J_no),
Amount INT NOT NULL,
Supply VARCHAR(10)

)

go
INSERT INTO SPJ VALUES ('s1', 'p1','j1', 200,'04.05.2017') 
INSERT INTO SPJ VALUES ('s1', 'p1','j4', 700,'10.05.2017')
INSERT INTO SPJ VALUES ('s2', 'p3','j1', 400,'05.06.2017')
INSERT INTO SPJ VALUES ('s2', 'p3','j2', 200,'10.06.2017')
INSERT INTO SPJ VALUES ('s2', 'p3','j3', 200,'05.07.2017')
INSERT INTO SPJ VALUES ('s2', 'p3','j4', 500,'10.07.2017')
INSERT INTO SPJ VALUES ('s2', 'p3','j5', 600,'20.07.2017')
INSERT INTO SPJ VALUES ('s2', 'p3','j6', 400,'10.08.2017')
INSERT INTO SPJ VALUES ('s2', 'p3','j7', 800,'20.08.2017')
INSERT INTO SPJ VALUES ('s2', 'p5','j2', 100,'10.09.2017')
INSERT INTO SPJ VALUES ('s3', 'p3','j1', 200,'05.10.2017')
INSERT INTO SPJ VALUES ('s3', 'p4','j2', 500,'20.10.2017')
INSERT INTO SPJ VALUES ('s4', 'p6','j3', 300,'05.11.2017')
INSERT INTO SPJ VALUES ('s4', 'p6','j7', 300,'20.11.2017')
INSERT INTO SPJ VALUES ('s5', 'p2','j2', 200,'05.12.2017')
INSERT INTO SPJ VALUES ('s5', 'p2','j4', 100,'09.01.2018')
INSERT INTO SPJ VALUES ('s5', 'p5','j5', 500,'25.01.2018')
INSERT INTO SPJ VALUES ('s5', 'p5','j7', 100,'05.02.2018')
INSERT INTO SPJ VALUES ('s5', 'p6','j2', 200,'10.02.2018')
INSERT INTO SPJ VALUES ('s5', 'p1','j4', 100,'26.02.2018')
INSERT INTO SPJ VALUES ('s5', 'p3','j4', 200,'30.02.2018')
INSERT INTO SPJ VALUES ('s5', 'p4','j4', 800,'02.03.2018')
INSERT INTO SPJ VALUES ('s5', 'p5','j4', 400,'20.03.2018')
INSERT INTO SPJ VALUES ('s5', 'p6','j4', 500,'10.05.2018')
go

