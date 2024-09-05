-- SQL query script to:

    -- The top grades for each student

     WITH sgrades AS (
			SELECT  allCOR.* ,  
				CASE 	WHEN CORNUM = 1 THEN grade_course_1 
						WHEN CORNUM = 2 THEN grade_course_2 
						WHEN CORNUM = 3 THEN grade_course_3 
				END AS mark
			FROM professors AS p
					JOIN courses AS c ON p.professor = c.course_prof
					JOIN (			SELECT c.* , s1.student_id , s1.student_forename, s1.student_surname, 1 AS corNum	FROM courses AS c		JOIN students AS s1 ON s1.student_course_1 = c.course 
							UNION
									SELECT c.* , s1.student_id , s1.student_forename, s1.student_surname, 2 				FROM courses AS c		JOIN students AS s1 ON s1.student_course_2 = c.course 
							UNION
									SELECT c.* , s1.student_id , s1.student_forename, s1.student_surname, 3				FROM courses AS c		JOIN students AS s1 ON s1.student_course_3 = c.course 
						  ) AS allCOR ON allCOR.course = C.course
					JOIN grades AS g ON g.grade_student_id = allCOR.student_id 
					 ORDER BY allCOR.student_id
                     )
                     SELECT student_id , student_forename, student_surname, MAX(mark) AS max_grade
                     FROM sgrades 
                     GROUP BY student_id , student_forename, student_surname
                     ORDER BY student_id 


