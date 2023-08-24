--------------------------------------------------------------
/*		              OUTER JOIN Expressions           		*/
--------------------------------------------------------------

--  OUTER JOIN Expressions Introduction

    /*  Query: “Find all information about every student, as well as the information
        about each course that student has taken.”      */

            -- ERRONEOUS! DOES NOT CONSIDER ALL STUDENTS!
				SELECT *
				FROM student NATURAL JOIN takes;
				
				SELECT *
				FROM student, takes
				WHERE student.ID = takes.ID;
				
				INSERT into student
				VALUES ('99999','Snowy','Comp. Sci.')
				
				SELECT *
				FROM student
				WHERE name  = 'Snowy';


--  INNER JOINS

    /*  The alternative, INNER JOIN, is the default JOIN type, and the keyword
        "INNER" is optional.  The following two queries are identical:        */

		SELECT *
		FROM student JOIN takes USING(ID);
		
		SELECT *
		FROM student INNER JOIN takes USING(ID);

--  LEFT and RIGHT OUTER JOINs

    /*  Query: “Find all information about students, as well as the information
        about each course that student has taken.”      */

		SELECT *
		FROM student NATURAL LEFT OUTER JOIN takes
		WHERE name ='Snowy';
		
		SELECT *
		FROM takes NATURAL RIGHT OUTER JOIN student;



    --  Query: “Find the name and ID of all students who have not taken a course.”
		
			SELECT name, ID
			FROM student NATURAL LEFT OUTER JOIN takes
			WHERE course_id IS NULL;


--  FULL OUTER JOINs

    /*  Query: "Display a list of all students in the Comp. Sci. department, 
	along with the course sections, if any, that they have taken in Spring 2009; 
	all course sections from Spring 2009 must be displayed, even if no student 
	from the Comp. Sci. department has taken the course section." */
	
	SELECT *
	FROM (
			SELECT*
			FROM student
			WHERE dept_name='Comp. Sci.') AS foo
			NATURAL FULL OUTER JOIN
			(SELECT *
			FROM takes 
			WHERE semester= 'Spring'AND year=2009)AS bar;


    --  Alternatively, using the WITH construct:
	
	WITH compsci_student AS
		SELECT *
		FROM student 
		WHERE dept_name= 'Comp. Sci.',
	Spring 2009_takers AS
		SELECT* 
		FROM takes
		WHERE semester='Spring' AND year =2009
		SELECT *
		FROM compsci_student NATURAL FULL OUTER JOIN spring 
	

-- The ON Clause
	-- ON Clause Example with OUTER JOIN Expression:
			SELECT *
			FROM student LEFT OUTER JOIN takes ON student.ID=takes.ID


	-- The following query DOES NOT produce the same results as the above:
		SELECT*
		FROM student LEFT OUTER JOIN takes ON TRUE
		WHERE student.ID= takes.ID;













