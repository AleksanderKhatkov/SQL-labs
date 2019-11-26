/*Лабораторная работа 10*/
--1.1. Добавить в таблицы CPU, HDD и Monitor по столбцу, который обозначает количество единиц изделия и имеет формат DECIMAL(5).
ALTER TABLE  cpu add  quantity DECIMAL(5)
select*from cpu;
ALTER TABLE  hdd Add quantity DECIMAL(5)
select*from hdd;
ALTER TABLE  Monitor add quantity DECIMAL(5)
select*from Monitor;

 --1.2. Для процессоров, тактовая частота которых больше 1000 Мгц, заполнить столбец количество в таблице CPU значением 500.
 UPDATE CPU set quantity=500 Where Frequency >=1000
 select * from CPU
 --1.3 Выбрать из таблицы CPU информацию о процессорах, количество которых не определено
 select*from cpu where quantity is null
 select * from CPU
 --1.4 Выбрать из таблицы CPU информацию о процессорах, количество которых определено.
 select*from cpu where quantity is not null
 select * from cpu
 --1.5 Для процессоров, тактовая частота которых меньше 1000 Мгц, заполнить столбец количество в таблице CPU значением 200.
 Update CPU set quantity = 200  where frequency < 1000 
 select * from cpu
 /*1.6 Установить на каждый из добавленных в таблицы CPU, HDD и Monitor столбцов ограничение, 
 которое обеспечит, что количество единиц изделия не может быть меньше нуля.*/
 ALTER TABLE CPU ADD CONSTRAINT quant check(quantity > 0);
 ALTER TABLE HDD ADD CONSTRAINT quant_HDD check(quantity > 0);
 ALTER TABLE Monitor ADD CONSTRAINT quant_monitor check(quantity > 0);
 select*from cpu;
 select*from hdd;
 select*from Monitor;

 /*1.7. Добавить в таблицу Computer столбец цена, который имеет формат DECIMAL(10,2) и имеет ограничение, что цена компьютера не может быть меньше $300.*/
 ALTER TABLE Computer ADD price DECIMAL(10,2) constraint ch_price check(price > 300)
 select*from Computer;
 /*1.8. Отключить ограничение на цену компьютера.*/
 alter table computer nocheck constraint ch_price
 /*1.9. Внести в столбец, добавленный в таблицу Computer, следующие стоимости компьютеров. Для компьютеров фирмы I-1, I-2, I-3, I-4 фирмы IBM установить соответственно
 цены  $800, $1000, $1300, $1600. Для компьютеров D-3, D-4 фирмы Dell установить соответственно цены  $1200, $1300. Для компьютеров C-1, C-2, C-3, C-4 фирмы Compaq установить соответственно цены  $800, $900, $1000, $1100.*/
update computer set price = 800 where model = 'I-1'
update computer set price = 1000 where model = 'I-2'
update computer set price = 1300 where model = 'I-3'
update computer set price = 1600 where model = 'I-4'
update computer set price = 1200 where model = 'D-3'
update computer set price = 1300 where model = 'D-4'
update computer set price = 800 where model = 'C-1'
update computer set price = 900 where model = 'C-2'
update computer set price = 1000 where model = 'C-3'
update computer set price = 1100 where model = 'C-4'

/*1.10. Включить ограничение на цену компьютера.*/
alter table computer check constraint ch_price
/*1.11. Удалить из таблицы Computer компьютеры, цена которых меньше $1000.*/
delete from Computer where price < 1000
/*1.10. Изменить ограничение на цену компьютера. Новое ограничение должно обеспечивать, что цена компьютера может изменяться от $1000 до $10.000.*/
alter table computer add constraint ch_price_1 check(price >= 1000 and price <= 10000);

Select*from CPU;
Select*from HDD;
Select*from Monitor;
Select*from Computer
 