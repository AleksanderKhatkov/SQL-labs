use education;
--Разработать курсор для вывода списка 
--названия университета,проживающих в Воронеже студентов
DECLARE  @funi   VARCHAR(50),
         @fam     VARCHAR(50),
         @message VARCHAR(80)
PRINT ' Список студентов'
DECLARE stud_cursor CURSOR LOCAL FOR
    SELECT Univ_name, surname +' '+ fname
from student
join UNIVERSITY on student.UNIV_ID=UNIVERSITY.UNIV_ID
    WHERE student.city='Воронеж'
    ORDER BY 1;
OPEN stud_cursor
FETCH NEXT FROM stud_cursor INTO @funi, @fam
WHILE @@FETCH_STATUS=0
BEGIN
    SELECT @message='Студент: '+@fam+
                    ' ВУЗ: '+ @funi  
    PRINT @message
-- переход к следующему
FETCH NEXT FROM stud_cursor 
      INTO @funi, @fam
END
CLOSE stud_cursor
DEALLOCATE stud_cursor

/*Разработать курсор для вывода списка 
--названия университета,проживающих в Москве студентов,
 и их оценки по экзаменам. */
DECLARE @id_s    INT,
        @funi     VARCHAR(50),
        @fam      VARCHAR(50),       
        @message  VARCHAR(80),
        @nam      VARCHAR(50),
        @d        VARCHAR(10),
        @p        INT,
        @s        INT
SET @s=0
PRINT '  Список студентов'
DECLARE stud_cursor CURSOR LOCAL FOR
SELECT  student. student_ID,Univ_name, surname +' '+ fname
from student
join UNIVERSITY on student.UNIV_ID=UNIVERSITY.UNIV_ID
    WHERE student.city='Воронеж'
    ORDER BY 1;
OPEN stud_cursor
FETCH NEXT FROM stud_cursor
INTO @id_s, @funi, @fam
WHILE @@FETCH_STATUS=0
BEGIN
  SELECT @message='Студент: '+@fam+
                    ' ВУЗ: '+ @funi  
    PRINT @message
    SELECT @message='Предмет        Дата экзамена Оценка'
    PRINT @message
    DECLARE mark_cursor CURSOR FOR
        SELECT subj_name, exam_date,mark
        FROM  subject INNER JOIN exam_marks ON 
        exam_marks.subj_id=subject.subj_id
        WHERE exam_marks.student_id=@id_s

    OPEN mark_cursor
    FETCH NEXT FROM mark_cursor
      INTO @nam, @d, @p
    IF @@FETCH_STATUS<>0
        PRINT ' Нет оценок'
    WHILE @@FETCH_STATUS=0
    BEGIN
        SELECT @message='   '+@nam+'   '+
           @d+'  '+
           CAST(@p AS varCHAR(4))
        PRINT @message
        SET @s=@s+@p
        FETCH NEXT FROM mark_cursor
        INTO @nam, @d, @p  
    END
    CLOSE mark_cursor
    DEALLOCATE mark_cursor
     SELECT @message='Сумма баллов  '+
       CAST(@s AS CHAR(6))
    PRINT @message    
    FETCH NEXT FROM stud_cursor 
    INTO @id_s, @funi, @fam
END
CLOSE stud_cursor
DEALLOCATE stud_cursor

/*Использование курсора как выходного параметра процедуры. 
Процедура возвращает набор данных – список студентов.*/
DROP PROCEDURE my_proc
CREATE PROCEDURE my_proc
@cur CURSOR VARYING OUTPUT
AS
SET @cur=CURSOR FORWARD_ONLY STATIC FOR
SELECT surname +' '+ fname
from student
ORDER BY 1;
OPEN @cur

--Вызов процедуры и вывод на печать данных из выходного курсора 
DECLARE @my_cur CURSOR
DECLARE @n VARCHAR(50)
EXEC my_proc @cur=@my_cur OUTPUT
  FETCH NEXT FROM @my_cur INTO @n
  SELECT @n ФИО
WHILE (@@FETCH_STATUS=0)
BEGIN
  FETCH NEXT FROM @my_cur INTO @n
  SELECT @n ФИО
END
CLOSE @my_cur
DEALLOCATE @my_cur

exec my_proc
