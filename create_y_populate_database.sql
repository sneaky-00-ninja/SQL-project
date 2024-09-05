CREATE SCHEMA `project-02-schema` ;


-- **PROCESS FOR CREATIING PROFESSOR LIST**
-- To create PROF table... 

CREATE TABLE `project-02-schema`.`professors` (
  `professors_id` INT NOT NULL AUTO_INCREMENT,
  `professor` VARCHAR(20) NOT NULL DEFAULT 'Nobody',
  PRIMARY KEY (`professors_id`),
  UNIQUE INDEX `professors_id_UNIQUE` (`professors_id` ASC) VISIBLE);


-- To select 5 professors randomly from list. ...

CREATE table legends  (
  legend varchar(30) primary key
  );

INSERT into legends (legend) values
("Michael Jackson")  ,
("Albert Einstein")  ,
("Stephen Hawkins")  ,
("Albus Dumbledore")  ,
("Mr. T.")  ,
("Hulk Hogan") , 
("Christian Cullen")  ,
("Usain Bolt")  ,
("Buck Shelford") ,
("Mike Stewart") ,
("Mickael Knight") ,
("Jonah Lomu") ,
("Jack Daniels") ,
("Whitney Housten") ,
("Earnest Rutherford")  ,
("Eddard Stark")  ,
("Bon Jovi") ,
("Eddie Murphy") ,
("Bruce Lee")  ,
("Confucius")  ,
("Bill Murray") ,
("Michael Jones") ,
("David Hasselhoff") ,
("Johnny 5") ,
("Jim Beam") ,
("Anne Sullivan") ,
("Elle Macpherson") ,
("Kevin Bacon") ,
("Charles Darwin") ,
("Isaac Newton") ,
("Kevin B Wilson") ,
("Optimus Prime") ,
("Rowan Atkinson") ,
("John Lennon") ,
("Kenny Loggins") ,
("David Attenborough") ,
("Peter Blake") ,
("John Trevolta") ,
("Ada Lovelace") ,
("Borris Becker") ,
("Lionel Richie") ;
  SELECT * 
 FROM legends;


 INSERT INTO professors ( professor)
VALUES ((SELECT legend FROM legends ORDER BY RAND() LIMIT 1) );  
 INSERT INTO professors ( professor)
VALUES ((SELECT legend FROM legends ORDER BY RAND() LIMIT 1) );  
 INSERT INTO professors ( professor)
VALUES ((SELECT legend FROM legends ORDER BY RAND() LIMIT 1) );  
 INSERT INTO professors ( professor)
VALUES ((SELECT legend FROM legends ORDER BY RAND() LIMIT 1) );  
 INSERT INTO professors ( professor)
VALUES ((SELECT legend FROM legends ORDER BY RAND() LIMIT 1) );  	


 SELECT * 
 FROM professors;


-- The following can be repeated for different professor_id values if duplicates occur. 

 UPDATE professors
SET professor = (SELECT legend FROM legends ORDER BY RAND() LIMIT 1)
WHERE professors_id = 5;

 SELECT * 
 FROM professors;




-- **PROCESS FOR CREATIING COURSE LIST**
-- To create COURSE table... 

ALTER TABLE `project-02-schema`.`professors` 
DROP PRIMARY KEY,
ADD PRIMARY KEY (`professors_id`, `professor`),
ADD UNIQUE INDEX `professor_UNIQUE` (`professor` ASC) VISIBLE;
ALTER TABLE `project-02-schema`.`professors` ALTER INDEX `professors_id_UNIQUE` VISIBLE;


CREATE TABLE `project-02-schema`.`courses` (
  `courses_id` INT NOT NULL AUTO_INCREMENT,
  `course` VARCHAR(16) NOT NULL,
  `course_prof` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`courses_id`),
  UNIQUE INDEX `courses_id_UNIQUE` (`courses_id` ASC) VISIBLE,
  INDEX `course-has-prof_idx` (`course_prof` ASC) VISIBLE,
  CONSTRAINT `course-has-prof`
    FOREIGN KEY (`course_prof`)
    REFERENCES `project-02-schema`.`professors` (`professor`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);


-- To select course with random professor  from PROF list. ...

INSERT INTO courses ( course, course_prof)
VALUES 
 ("Business admin" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Computer Science" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Engineering" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Finance" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Psychology" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Law" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Medicine" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Accounting" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Communications" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Economics" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Art" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("History" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Marketing" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Biology" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Construction" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Management" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Science" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("English" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Mathematics" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) )  ,
 ("Chemistry" , (SELECT professor FROM professors ORDER BY RAND() LIMIT 1) ) ;
  
  SELECT * 
 FROM courses;


-- adjust course table... course to have unique value --

ALTER TABLE `project-02-schema`.`courses` 
CHANGE COLUMN `courses_id` `courses_id` INT NOT NULL AUTO_INCREMENT ,
ADD UNIQUE INDEX `course_UNIQUE` (`course` ASC) VISIBLE;
;




-- **PROCESS FOR CREATIING STUDENTS LIST**
-- To create Students table... 

CREATE TABLE `project-02-schema`.`students` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `student_forename` VARCHAR(12) NOT NULL,
  `student_surname` VARCHAR(10) NOT NULL,
  `student_course_1` VARCHAR(16) NOT NULL,
  `student_course_1_prof` VARCHAR(20) NOT NULL,
  `student_course_2` VARCHAR(16) NOT NULL,
  `student_course_2_prof` VARCHAR(20) NOT NULL,
  `student_course_3` VARCHAR(16) NOT NULL,
  `student_course_3_prof` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE INDEX `students_id_UNIQUE` (`student_id` ASC) VISIBLE,
  INDEX `student-has-course-1_idx` (`student_course_1` ASC) VISIBLE,
  INDEX `student-has-prof-1_idx` (`student_course_1_prof` ASC) VISIBLE,
  INDEX `student-has-course-2_idx` (`student_course_2` ASC) VISIBLE,
  INDEX `student-has-prof-2_idx` (`student_course_2_prof` ASC) VISIBLE,
  INDEX `student-has-course-3_idx` (`student_course_3` ASC) VISIBLE,
  INDEX `student-has-prof-3_idx` (`student_course_3_prof` ASC) VISIBLE,
  CONSTRAINT `student-has-course-1`
    FOREIGN KEY (`student_course_1`)
    REFERENCES `project-02-schema`.`courses` (`course`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `student-has-prof-1`
    FOREIGN KEY (`student_course_1_prof`)
    REFERENCES `project-02-schema`.`courses` (`course_prof`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `student-has-course-2`
    FOREIGN KEY (`student_course_2`)
    REFERENCES `project-02-schema`.`courses` (`course`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `student-has-prof-2`
    FOREIGN KEY (`student_course_2_prof`)
    REFERENCES `project-02-schema`.`courses` (`course_prof`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `student-has-course-3`
    FOREIGN KEY (`student_course_3`)
    REFERENCES `project-02-schema`.`courses` (`course`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `student-has-prof-3`
    FOREIGN KEY (`student_course_3_prof`)
    REFERENCES `project-02-schema`.`courses` (`course_prof`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- create lists for forenames and surnames ... 

CREATE table forenames (
  forename varchar(15) primary key
  );

INSERT into forenames (forename) values
("James")  ,
("Michael")  ,
("Robert") , 
("John")  ,
("David")  ,
("William") ,
("Richard") ,
("Joseph") ,
("Thomas") ,
("Christopher") ,
("Charles") ,
("Daniel") ,
("Matthew") ,
("Anthony") ,
("Mark") ,
("Donald") ,
("Steven") ,
("Andrew") ,
("Paul") ,
("Joshua") ,
("Kenneth") ,
("Kevin") ,
("Brian") ,
("Timothy") ,
("Ronald") ,
("George") ,
("Jason") ,
("Edward") ,
("Jeffrey") ,
("Ryan") ,
("Jacob") ,
("Nicholas") ,
("Gary") ,
("Eric") ,
("Jonathan") ,
("Stephen") ,
("Larry") ,
("Justin") ,
("Scott") ,
("Brandon") ,
("Benjamin") ,
("Samuel") ,
("Gregory") ,
("Alexander") ,
("Patrick") ,
("Frank") ,
("Raymond") ,
("Jack") ,
("Dennis") ,
("Jerry") ,
("Mary") ,
("Patricia") ,
("Jennifer") ,
("Linda") ,
("Elizabeth") ,
("Barbara") , 
("Susan") ,
("Jessica") ,
("Karen") ,
("Sarah") ,
("Lisa") ,
("Nancy") ,
("Sandra") ,
("Betty") ,
("Ashley") ,
("Emily") ,
("Kimberly") ,
("Margaret") ,
("Donna") ,
("Michelle") ,
("Carol") ,
("Amanda") ,
("Melissa") ,
("Deborah") ,
("Stephanie") ,
("Rebecca") ,
("Sharon") ,
("Laura") ,
("Cynthia") ,
("Dorothy") ,
("Amy") ,
("Kathleen") , 
("Angela") ,
("Shirley") ,
("Emma") ,
("Brenda") ,
("Pamela") ,
("Nicole") ,
("Anna") ,
("Samantha") ,
("Katherine") ,
("Christine") ,
("Debra") ,
("Rachel") ,
("Carolyn") ,
("Janet") ,
("Maria") ,
("Olivia") ,
("Heather") ,
("Helen") ;



CREATE table surnames (
  surname varchar(15) primary key
  );


INSERT into surnames (surname) values
("Smith") ,
("Brown") ,
("Wilson") ,
("Thomson") ,
("Robertson") , 
("Campbell") ,
("Stewart") ,
("Anderson") ,
("Jones") ,
("Scott") ,
("Reid") ,
("Murray") , 
("Taylor") ,
("Clark") ,
("Mitchell") ,
("Ross") ,
("Walker") ,
("Paterson") ,
("Young") ,
("Watson") ,
("Morrison") ,
("Miller") ,
("Fraser") ,
("Davidson") ,
("Gray") ,
("Mcdonald") ,
("Henderson") ,
("Johnston") ,
("Hamilton") ,
("Graham") ,
("Kerr") ,
("Simpson") ,
("Martin") ,
("Ferguson") ,
("Cameron") ,
("Duncan") ,
("Hunter") ,
("Kelly") ,
("Bell") ,
("Grant") ,
("Mackenzie") ,
("Mackay") ,
("Allan") ,
("Black") ,
("Macleod") ,
("Mclean") ,
("Russell") ,
("Gibson") ,
("Wallace") ,
("Gordon") ;


-- changed student table to not have duplicat courses
 -- first.. added null professor. (so can add student without profs... and later update  with actual prof)
  INSERT INTO professors ( professor)
VALUES ("NONE" );  


-- removed foreign key for profs in student table... 

ALTER TABLE `project-02-schema`.`students` 
DROP FOREIGN KEY `student-has-prof-3`,
DROP FOREIGN KEY `student-has-prof-2`,
DROP FOREIGN KEY `student-has-prof-1`;
ALTER TABLE `project-02-schema`.`students` 
ADD UNIQUE INDEX `student_course_1_UNIQUE` (`student_course_1` ASC) VISIBLE,
ADD UNIQUE INDEX `student_course_2_UNIQUE` (`student_course_2` ASC) VISIBLE,
ADD UNIQUE INDEX `student_course_3_UNIQUE` (`student_course_3` ASC) VISIBLE,
DROP INDEX `student-has-prof-3_idx` ,
DROP INDEX `student-has-prof-2_idx` ,
DROP INDEX `student-has-prof-1_idx` ;
;


-- Now to add each student... 

--  INSERT INTO students( student_forename, student_surname, student_course_1, student_course_1_prof, student_course_2, student_course_2_prof, student_course_3, student_course_3_prof )
--   VALUES (
--     (SELECT forename FROM forenames ORDER BY RAND() LIMIT 1), 
--     (SELECT surname FROM surnames ORDER BY RAND() LIMIT 1), 
--     (SELECT course FROM courses ORDER BY RAND() LIMIT 1), 
--     "NONE",     
--     (SELECT course FROM courses ORDER BY RAND() LIMIT 1), 
--     "NONE",     
--     (SELECT course FROM courses ORDER BY RAND() LIMIT 1), 
--     "NONE"
-- 	)	;
 
 -- repeated the above dozens of times.. seemed to max-out at 15 students. 
 -- so now to remove the UNIQUE property from students table.... 
ALTER TABLE `project-02-schema`.`students` 
DROP INDEX `student_course_3_UNIQUE` ,
DROP INDEX `student_course_2_UNIQUE` ,
DROP INDEX `student_course_1_UNIQUE` ;
;

-- creat temp table for 3 difffent subjects... 

CREATE TABLE `project-02-schema`.`temp_courses` (
  `temp_1` VARCHAR(16) NOT NULL,
  `temp_2` VARCHAR(16) NOT NULL,
  `temp_3` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`temp_1`),
  UNIQUE INDEX `temp_1_UNIQUE` (`temp_1` ASC) VISIBLE,
  UNIQUE INDEX `temp_2_UNIQUE` (`temp_2` ASC) VISIBLE,
  UNIQUE INDEX `temp_3_UNIQUE` (`temp_3` ASC) VISIBLE);
    SELECT * 
    FROM temp_courses;


-- set initial temp course values... then CHECK that it ran WITH NO DUPLICATES !!! 

INSERT INTO `temp_courses` ()
 VALUES ( 
	  (SELECT course FROM courses ORDER BY RAND() LIMIT 1), 
      (SELECT course FROM courses ORDER BY RAND() LIMIT 1), 
      (SELECT course FROM courses ORDER BY RAND() LIMIT 1)
 );

SELECT * 
 FROM temp_courses;

-- Now update with new courses, then insert new non duplicate list into new student line. 

DELIMITER $$
CREATE PROCEDURE get_random_students()
BEGIN
    DECLARE counter INT DEFAULT 0;
    WHILE counter < 100 DO
        SET SQL_SAFE_UPDATES = 0;
			UPDATE `temp_courses` SET temp_1 = (SELECT course FROM courses ORDER BY RAND() LIMIT 1);
			UPDATE `temp_courses` SET temp_2 = (SELECT course FROM courses ORDER BY RAND() LIMIT 1);
			UPDATE `temp_courses` SET temp_3 = (SELECT course FROM courses ORDER BY RAND() LIMIT 1);
        SET SQL_SAFE_UPDATES = 1;
        INSERT INTO students(student_forename, student_surname, student_course_1, student_course_1_prof, student_course_2, student_course_2_prof, student_course_3, student_course_3_prof)
        VALUES (
            (SELECT forename FROM forenames ORDER BY RAND() LIMIT 1), 
            (SELECT surname FROM surnames ORDER BY RAND() LIMIT 1), 
            (SELECT temp_1 FROM temp_courses LIMIT 1),'NONE', 
            (SELECT temp_2 FROM temp_courses LIMIT 1),'NONE', 
            (SELECT temp_3 FROM temp_courses LIMIT 1),'NONE'
        );
        SET counter = counter + 1; 
    END WHILE;
END $$
DELIMITER ;

CALL random_students();


-- SELECT COUNT(student_id)
-- FROM students;
-- SELECT *
-- FROM students;

-- intended TODO ***   if possible..-- update each students professors



-- **PROCESS FOR CREATIING GRADES LIST**

CREATE TABLE `project-02-schema`.`grades` (
  `grades_id` INT NOT NULL AUTO_INCREMENT,
  `grade` INT NULL,
  `grade_student_id` INT NOT NULL,
  `grade_course_1` INT NULL DEFAULT NULL,
  `grade_course_2` INT NULL DEFAULT NULL,
  `grade_course_3` INT NULL DEFAULT NULL,
  `grade_professor` VARCHAR(20) NULL,
  PRIMARY KEY (`grades_id`),
  UNIQUE INDEX `grades_id_UNIQUE` (`grades_id` ASC) VISIBLE,
  INDEX `grade-has-student_idx` (`grade_student_id` ASC) VISIBLE,
  CONSTRAINT `grade-has-student`
    FOREIGN KEY (`grade_student_id`)
    REFERENCES `project-02-schema`.`students` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);


-- for each existing student-id.... 
-- INSERT INTO grades () ...   these scripts were created VERY EASILY using CONCATENATE on a spreadsheet. *

INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 1 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 2 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 3 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 4 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 5 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 6 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 7 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 8 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 9 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 10 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 11 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 12 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 13 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 14 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 15 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 16 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 17 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 18 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 19 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 20 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 21 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 22 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 23 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 24 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 25 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 26 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 27 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 28 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 29 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 30 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 31 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 32 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 33 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 34 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 35 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 36 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 37 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 38 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 39 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 40 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 41 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 42 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 43 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 44 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 45 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 46 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 47 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 48 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 49 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 50 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 51 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 52 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 53 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 54 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 55 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 56 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 57 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 58 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 59 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 60 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 61 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 62 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 63 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 64 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 65 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 66 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 67 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 68 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 69 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 70 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 71 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 72 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 73 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 74 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 75 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 76 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 77 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 78 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 79 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 80 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 81 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 82 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 83 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 84 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 85 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 86 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 87 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 88 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 89 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 90 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 91 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 92 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 93 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 94 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 95 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 96 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 97 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 98 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 99 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
INSERT INTO grades (grade_student_id, grade_course_1, grade_course_2, grade_course_3) VALUES ( 100 , (SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number),(SELECT FLOOR(0 + RAND()*(100 - 0 + 1)) AS Random_Number));
--  SELECT * 
--  FROM grades;


--  **NOTE **   the following was used to DELETE  some duplicates... because i had accidentally added some. 
  -- SELECT *
  -- FROM GRADES
  -- WHERE grade_student_id = 4;

  -- BEGIN;
  -- DELETE FROM grades
  -- WHERE grade_student_id = 4;
  -- ROLLBACK;   --  ****


-- *****************END OF CREATING DATABASE PROCEDURE. *******************************************  *******
-- ************************************************************** *******

-- SELECT * 
--  FROM students;
-- SELECT * 
--  FROM professors;
-- SELECT * 
--  FROM courses;
-- SELECT * 
--  FROM grades;
