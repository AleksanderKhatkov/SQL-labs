SELECT max  (STIPEND)FROM STUDENT
SELECT count (*) from STUDENT
SELECT COUNT(DISTINCT STIPEND)FROM STUDENT
SELECT AVG(mark*1.0) from EXAM_MARKS where mark is not null;
SELECT CONVERT(decimal(3,1), sum (isnull((mark*1.0),0))) from EXAM_MARKS where mark is not null;
SELECT min(mark) from EXAM_MARKS;
SELECT STUDENT_ID, SUBJ_ID count from EXAM_MARKS group by STUDENT_ID, SUBJ_ID;
SELECT STUDENT_ID, SUM(MARK) FROM EXAM_MARKS WHERE STUDENT_ID >10 GROUP BY STUDENT_ID HAVING SUM(MARK)>4 ORDER BY 2;