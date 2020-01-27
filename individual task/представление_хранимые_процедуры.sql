/*3 ������� ������������� ��� �������� ������, ���������� ������ � ����������� ����� ������*/
CREATE VIEW  ����������_������_����� AS 
Select �������.id_�������, �������.id_������, �������.����, �������.��������,�������.id_�������_�������������, 
������.������, ������.������, �������.id_�����_������_�����,�������.���,�������.���������, �������.�������, �������.���������
from ������� JOIN ������ ON  �������.id_�������=������.id_������� 
JOIN ������� ON �������.id_�����_������_�����=������.id_�����_������_����� Where ������.������='�������'; 
select*from ����������_������_�����;

/*4.������� ������� ��������� 
1.��� ���������� ��������� ���������� �� 10%*/
drop procedure stipend -- �������� ���������
use ��������
go
CREATE PROCEDURE Stipend (@STIPED decimal (10)) AS 
BEGIN
UPDATE ������� SET @STIPED=@STIPED*1.1 Where �������.id_�����_������_����� in (select ������.id_�����_������_����� from ������� JOIN ������ ON 
�������.id_�����_������_�����=������.id_�����_������_����� Where ������.������=10)
END 
EXEC Stipend 100 --������ �������� ��������� 
select*from �������

/*2.��� �������� ��������� �� ��������� ����*/
drop procedure student_curs;
GO
CREATE PROCEDURE student_curs (@curs decimal (10)) AS
SET @curs = 0
BEGIN
UPDATE ������ SET @curs=@curs+1 Where EXISTS (select ������.���� from ������� 
JOIN ������ ON �������.id_������=������.id_������ Where @curs<=5)
END;
EXEC student_curs @curs=0;
select*from ������

/*3.��� ���������� ���������, ����������� ����� ���� �������������������� ������� (�� 1 �� 3 ������) � ������ */
drop procedure date_exsamen;
GO
CREATE PROCEDURE date_exsamen (@date1 date, @date2 date) AS
BEGIN
SELECT DISTINCT �������.id_�����_������_�����, �������.�������, �������.��� FROM ������� 
JOIN ������ ON �������.id_�����_������_�����=������.id_�����_������_����� 
JOIN ������� ON �������.id_�������=������.id_�������
Where ������.������<=3 and �������.���� BETWEEN @date1 and @date2;
END
EXEC date_exsamen @date1='2019-05-10', @date2='2019-05-17';


/*4. ��� ��������� ������� ��� �������� ��������� ��������*/
drop procedure access_student;
GO
CREATE PROCEDURE access_student (@name varchar(20),@surname varchar(20), @fname varchar(20),@mark int, @date1 date, @date2 date)
AS
BEGIN
insert into access_student (@name, @surname,  @fname, @mark, @date1, @date2) values (@name, @surname,  @fname, @mark, @date1, @date2)
END
EXEC access_student @name='���������', @surname='�������������', @fname ='�������', @mark =10, @date1 ='2019-05-10', @date2 ='2019-05-17'; 