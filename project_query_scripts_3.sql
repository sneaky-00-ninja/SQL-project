-- SQL query script to:
    -- Sort students by the courses that they are enrolled in

SELECT c.courses_id, c.course,  s.student_forename, s.student_surname 	FROM courses AS c		JOIN students AS s ON s.Student_course_1 = c.course      
	UNION        
SELECT c.courses_id, c.course,  s.student_forename, s.student_surname	  FROM courses AS c		JOIN students AS s ON s.student_course_2 = c.course      
	UNION        
SELECT c.courses_id, c.course,  s.student_forename, s.student_surname 	FROM courses AS c		JOIN students AS s ON s.student_course_3 = c.course	
ORDER BY course ASC  
                       