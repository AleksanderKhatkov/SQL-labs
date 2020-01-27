
--DROP DATABASE �������� -- ������� ����
CREATE DATABASE  �������� -- ������� ���� 

CREATE TABLE �������
(
id_������� INT PRIMARY KEY,
�������� varchar(50))

go
insert into ������� values(1,'�������������� ������� � ����������������');
insert into ������� values(2,'������������ ����������� �������������� ����������');
go


CREATE TABLE ������
(
id_������ INT PRIMARY KEY,
����� INT,
���� INT check (1 <= ���� and ���� <= 5)) -- check1 (�����������)


go
insert into ������ values(1,100,1);
insert into ������ values(2,200,2);
insert into ������ values(3,300,3);
insert into ������ values(4,400,4);
insert into ������ values(5,500,5);
go


CREATE TABLE �������������
(
id_������������� INT PRIMARY KEY,
��� varchar(20),
�������� varchar(20),
������� varchar(20),
id_������� int references �������(id_�������)) -- ������� �����

go
insert into ������������� values(1,'�����','��������','������', 1);
insert into ������������� values(2,'�����','���������','��������', 1);
insert into ������������� values(3,'�������','�����','������������', 1);
insert into ������������� values(4,'���������','�����','���������', 1);
insert into ������������� values(5,'�������','��������','������������', 2);
insert into ������������� values(6,'���������','�������������','���������', 2);
insert into ������������� values(7,'������','������������','������', 2);
insert into ������������� values(8,'�������','����������','������', 2);
go


CREATE TABLE �������
(
id_�����_������_����� INT PRIMARY KEY,
��� varchar(20),
��������� varchar(20),
������� varchar(20),
��������� int,
id_������ int references ������(id_������))

go
insert into ������� values(1,'������','����������','������', 100,1);
insert into ������� values(2,'������','��������','����������',150,1);
insert into ������� values(3,'���������','����������','��������',90,1);
insert into ������� values(4,'������','�������������','�������',150,2);
insert into ������� values(5,'�����','����������','��������',130,2);
insert into ������� values(6,'�������','���������','��������',120,2);
insert into ������� values(7,'������','�������������','��������',140,3);
insert into ������� values(8,'�����','��������','���������',200,3);
insert into ������� values(9,'������','���������','���������',140,3);
insert into ������� values(10,'������','������������','�������',110,4);
insert into ������� values(11,'������','����������','�������',250,4);
insert into ������� values(12,'�����','��������','�������',100,4);
insert into ������� values(13,'�������','����������','������',120,5);
insert into ������� values(14,'��������','����������','���������',155,5);
insert into ������� values(15,'����','���������','�������',167,5);
go


CREATE TABLE �������
(
id_������� INT PRIMARY KEY,
�������� varchar(40)
)

go
insert into ������� values(1,'���� ������');
insert into ������� values(2,'�������� ����������');
insert into ������� values(3,'����������� ����������� ������������');
insert into ������� values(4,'������ ���');
insert into ������� values(5,'���������');
go


CREATE TABLE �������_�������������
(
id_�������_������������� INT PRIMARY KEY,
id_������������� int references �������������(id_�������������),
id_������� int references �������(id_�������)
)


go
insert into �������_������������� values(1,8,1);
insert into �������_������������� values(2,7,2);
insert into �������_������������� values(3,6,3);
insert into �������_������������� values(4,2,4);
insert into �������_������������� values(5,5,5);
insert into �������_������������� values(6,4,2);
insert into �������_������������� values(7,1,3);
insert into �������_������������� values(8,3,4);
go


CREATE TABLE �������
(
id_������� INT PRIMARY KEY,
�������� VARCHAR(20),
���� date,
id_�������_������������� int references �������_�������������(id_�������_�������������),
id_������ int references ������(id_������))

go
insert into ������� values(1,'250A','2019-05-10',1,1); 
insert into ������� values(2,'250A','2019-05-11',2,2);
insert into ������� values(3,'450B','2019-05-15',3,3);
insert into ������� values(4,'450B','2019-05-16',4,4);
insert into ������� values(5,'450B','2019-05-17',5,5);
go


CREATE TABLE ������
(
id_�����_������_����� int references �������(id_�����_������_�����),
id_������� int references �������(id_�������),
������ VARCHAR(20) check(������ = '�������' or ������='�� �������'),--check2
������ INT check(1 <= ������ and ������ <= 10)) --check3


go
insert into ������ values(1,1,'�������', 8);
insert into ������ values(1,2,'�������', 9);
insert into ������ values(1,3,'�������', 7);
insert into ������ values(1,4,'�������', 9);
insert into ������ values(1,5,'�������', 9);

insert into ������ values(2,1,'�������', 6);
insert into ������ values(2,2,'�������', 4);
insert into ������ values(2,3,'�������', 7);
insert into ������ values(2,4,'�������', 7);
insert into ������ values(2,5,'�������', 7);

insert into ������ values(3,1,'�� �������', 2);
insert into ������ values(3,2,'�� �������', 2);
insert into ������ values(3,3,'�� �������', 2);
insert into ������ values(3,4,'�� �������', 2);
insert into ������ values(3,5,'�� �������', 3);

insert into ������ values(4,1,'�������', 10);
insert into ������ values(4,2,'�������', 10);
insert into ������ values(4,3,'�������', 10);
insert into ������ values(4,4,'�������', 10);
insert into ������ values(4,5,'�������', 10);

insert into ������ values(5,1,'�������', 10);
insert into ������ values(5,2,'�������', 10);
insert into ������ values(5,3,'�������', 10);
insert into ������ values(5,4,'�������', 10);
insert into ������ values(5,5,'�������', 10);

insert into ������ values(6,1,'�������', 8);
insert into ������ values(6,2,'�������', 5);
insert into ������ values(6,3,'�������', 4);
insert into ������ values(6,4,'�������', 7);
insert into ������ values(6,5,'�������', 9);

insert into ������ values(7,1,'�������', 7);
insert into ������ values(7,2,'�������', 5);
insert into ������ values(7,3,'�������', 5);
insert into ������ values(7,4,'�������', 8);
insert into ������ values(7,5,'�������', 9);

insert into ������ values(8,1,'�������', 8);
insert into ������ values(8,2,'�������', 9);
insert into ������ values(8,3,'�������', 7);
insert into ������ values(8,4,'�������', 9);
insert into ������ values(8,5,'�������', 10);

insert into ������ values(9,1,'�������', 4);
insert into ������ values(9,2,'�������', 4);
insert into ������ values(9,3,'�������', 5);
insert into ������ values(9,4,'�������', 6);
insert into ������ values(9,5,'�������', 8);

insert into ������ values(10,1,'�������', 7);
insert into ������ values(10,2,'�������', 8);
insert into ������ values(10,3,'�������', 8);
insert into ������ values(10,4,'�������', 9);
insert into ������ values(10,5,'�������', 9);

insert into ������ values(11,1,'�������', 9);
insert into ������ values(11,2,'�������', 10);
insert into ������ values(11,3,'�������', 9);
insert into ������ values(11,4,'�������', 7);
insert into ������ values(11,5,'�������', 9);

insert into ������ values(12,1,'�� �������', 3);
insert into ������ values(12,2,'�� �������', 3);
insert into ������ values(12,3,'�� �������', 3);
insert into ������ values(12,4,'�������', 7);
insert into ������ values(12,5,'�������', 9);

insert into ������ values(13,1,'�� �������', 2);
insert into ������ values(13,2,'�� �������', 2);
insert into ������ values(13,3,'�� �������', 2);
insert into ������ values(13,4,'�� �������', 2);
insert into ������ values(13,5,'�� �������', 3);

insert into ������ values(14,1,'�������', 7);
insert into ������ values(14,2,'�������', 10);
insert into ������ values(14,3,'�������', 8);
insert into ������ values(14,4,'�������', 9);
insert into ������ values(14,5,'�������', 8);

insert into ������ values(15,1,'�������', 8);
insert into ������ values(15,2,'�������', 9);
insert into ������ values(15,3,'�������', 7);
insert into ������ values(15,4,'�������', 7);
insert into ������ values(15,5,'�������', 6);
go


select*from �������
select*from ������
select*from �������������
select*from �������
select*from �������
select*from �������_�������������
select*from �������
select*from ������

--Alter table ������� add ��������� numeric(10,0) --�������� ����� ������� 
--Alter table ������� DROP COLUMN ���������; -- ������� ����� �������

--DROP DATABASE ��������
--DROP table 

