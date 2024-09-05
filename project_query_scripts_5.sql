-- SQL query script to:
    -- Finding which student and professor have the most courses in common



-- -Created a "VIEW" to easliy reuse all relevant data as desired.. 

CREATE VIEW stu_course_prof AS 
	SELECT c.courses_id, c.course_prof, c.course, s.student_id , s.student_forename, s.student_surname  FROM courses AS c		JOIN students AS s ON s.Student_course_1 = c.course      
		UNION        
	SELECT c.courses_id, c.course_prof, c.course, s.student_id , s.student_forename, s.student_surname 	FROM courses AS c		JOIN students AS s ON s.student_course_2 = c.course      
		UNION        
	SELECT c.courses_id, c.course_prof, c.course, s.student_id , s.student_forename, s.student_surname	FROM courses AS c		JOIN students AS s ON s.student_course_3 = c.course	
ORDER BY course_prof, student_id ASC  ;


  --  ***********THIS LISTS THE TOP COMMON COURSES!   BUT...  didn´t just show the top result for tied counts. (unless specific count limit chosesn)
-- SELECT course_prof, student_id, 
-- COUNT(courses_id) AS common_courses
-- FROM stu_course_prof  
-- GRoup by course_prof, student_id
-- ORDER BY common_courses DESC 
-- LIMIT 5;

-- Used a sub-query to count the common courses, then used WHERE keyword to refine result to just the MAX counted value. 

WITH common_course_count AS (
    SELECT course_prof, student_id, student_forename, student_surname, 
        COUNT(courses_id) AS common_courses
        FROM stu_course_prof  
    GROUP by course_prof, student_id, student_forename, student_surname
    ORDER BY common_courses DESC 
)
SELECT student_id , course_prof, common_courses , student_forename, student_surname
    FROM common_course_count
    WHERE common_courses =(
        SELECT MAX(common_courses)
        FROM common_course_count
    );

