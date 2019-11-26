/*Лабораторная работа 10*/
--1.1. Добавить в таблицы CPU, HDD и Monitor по столбцу, который обозначает количество единиц изделия и имеет формат DECIMAL(5).
ALTER TABLE  CPU ADD quantity DECIMAL(5)
ALTER TABLE  HDD ADD quantity DECIMAL(5)
ALTER TABLE  Monitor ADD quantity DECIMAL(5)

 --1.2. Для процессоров, тактовая частота которых больше 1000 Мгц, заполнить столбец количество в таблице CPU значением 500.
 UPDATE CPU set quantity=500 Where frequency >=1000;
 --1.3 Выбрать из таблицы CPU информацию о процессорах, количество которых не определено
 select*from cpu where quantity is null;
 --1.4 Выбрать из таблицы CPU информацию о процессорах, количество которых определено.
 select*from cpu where quantity is not null;
 --1.5 Для процессоров, тактовая частота которых меньше 1000 Мгц, заполнить столбец количество в таблице CPU значением 200.
 Update CPU set quantity=200  where frequency <1000 ;
 /*1.6 Установить на каждый из добавленных в таблицы CPU, HDD и Monitor столбцов ограничение, 
 которое обеспечит, что количество единиц изделия не может быть меньше нуля.*/
 ALTER TABLE CPU ADD CONSTRAINT quantity check(quantity <0);
 /*1.7. Добавить в таблицу Computer столбец цена, который имеет формат DECIMAL(10,2) и имеет ограничение, что цена компьютера не может быть меньше $300.*/
 ALTER TABLE Computer ADD price DECIMAL(10,2);
 Update select price from Computer Where price<300$;

Select*from CPU;
Select*from HDD;
Select*from Monitor;
Select*from Computer
 
 



 /*1.9  Внести в столбец, добавленный в таблицу Computer, следующие стоимости компьютеров. 
 Для компьютеров фирмы I-1, I-2, I-3, I-4 фирмы IBM установить соответственно 
 цены  $800, $1000, $1300, $1600. Для компьютеров D-3, D-4 фирмы 
 Dell установить соответственно цены  $1200, $1300. 
 Для компьютеров C-1, C-2, C-3, C-4 фирмы Compaq установить соответственно цены  $800, $900, $1000, $1100.

