--laba 9

SELECT*FROM CPU
SELECT*FROM HDD;
SELECT*FROM Monitor

--1.��������� ��������� ����������� Celeron ����� Intel �� 5%.
update CPU set price=price*0.95 where model='Celeron' and model='Intel';
--2.��������� ��������� ����������� Duron ����� AMD �� 10%.
update CPU set price=price*0.95 where model='Duron' and model='AMD';
--3.��������� ��������� ����������� ����� IBM �� 5%.
update HDD set price =price*1.05 where firm ='IBM';
--4.��������� ��������� ��������� � ���������� ������ 17 ������ �� 10%.
update Monitor set price =price*1.15 where diagonal=17;
--5.������� �� ������� CPU ����������, �������� ������� ������� ������ 800 ���.
delete from computer where CPU in (select code from cpu where frequency < 800);
delete from cpu where frequency<800;
--6.������� �� ������� Monitor ��������, ��������� ������� ����� 15 ������, ������ ������� ���������� � ������ ����������.
delete from Computer where Monitor in(select code from Monitor where diagonal=15);
delete from Monitor where diagonal=15
