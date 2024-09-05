-- SQL query script for:
    -- The average grade that is given by each professor

WITH allstuff AS (
			SELECT  allCOR.* ,  
				CASE 	WHEN CORNUM = 1 THEN grade_course_1 
						WHEN CORNUM = 2 THEN grade_course_2 
						WHEN CORNUM = 3 THEN grade_course_3 END AS mark
			FROM professors AS p
					JOIN courses AS c ON p.professor = c.course_prof
					JOIN (
            			SELECT c.* , s1.student_id , 1 AS corNum	FROM courses AS c		JOIN students AS s1 ON s1.student_course_1 = c.course 
							UNION
									SELECT c.* , s1.student_id , 2 				        FROM courses AS c		JOIN students AS s1 ON s1.student_course_2 = c.course 
							UNION
									SELECT c.* , s1.student_id , 3				        FROM courses AS c		JOIN students AS s1 ON s1.student_course_3 = c.course 
						    )
                AS allCOR ON allCOR.course = C.course
					JOIN grades AS g ON g.grade_student_id = allCOR.student_id 
			  ORDER BY allCOR.student_id
			)
	    SELECT course_prof , AVG(mark) AS avg_mark
FROM allstuff
GROUP BY course_prof 
