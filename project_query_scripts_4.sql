-- SQL query script to:
    -- Create a summary report of courses and their average grades, sorted by the most challenging course (course with the lowest average grade) to the easiest course

WITH allstuff AS (
    SELECT  allCOR.* ,  
        CASE 	WHEN CORNUM = 1 THEN grade_course_1 
                WHEN CORNUM = 2 THEN grade_course_2 
                WHEN CORNUM = 3 THEN grade_course_3 
        END AS mark
    FROM professors AS p
            JOIN courses AS c ON p.professor = c.course_prof
            JOIN (			SELECT c.* , s.student_id , s.student_forename, s.student_surname , 1 AS corNum		FROM courses AS c		JOIN students AS s ON s.student_course_1 = c.course 
                    UNION
                            SELECT c.* , s.student_id , s.student_forename, s.student_surname , 2 				FROM courses AS c		JOIN students AS s ON s.student_course_2 = c.course 
                    UNION
                            SELECT c.* , s.student_id , s.student_forename, s.student_surname , 3				FROM courses AS c		JOIN students AS s ON s.student_course_3 = c.course 
                    ) AS allCOR ON allCOR.course = C.course
            JOIN grades AS g ON g.grade_student_id = allCOR.student_id 
                ORDER BY allCOR.student_id
    )
SELECT course , AVG(mark) AS avg_grade
FROM allstuff
GROUP BY course
ORDER BY avg_grade ASC
