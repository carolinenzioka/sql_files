------------------------------------------------------------
/*			Additional Basic Operations Continued		  */
------------------------------------------------------------

--	Ordering the Display of Tuples

	/*	Query: “Find and list the names of all the instructors in the
		Physics department in alphabetical order.”		*/



	/*	Query: “Find and list all information about instructors at the university.
		Order the query results first in descending order of salary, then by ascending
		order of name in the event that several instructors have the same salary.”	*/



--	The Between Comparison

	--	Query: “Find the names of instructors with salary amounts between $90,000 and $100,000.”
	--	The following SQL queries are equivalent:



--	Row Constructor Notation

	-- Semi-General Form:	(a, b) <= (c, d) is equivalent to (a <= c) AND (b <= d)

	/*	Query: “For all instructors in the Biology department who have taught
		some course, find their names and the course ID of all courses they taught.”	*/

	--	The following two queries are identical:
		SELECT name, course_id
		FROM instructor, teaches
		WHERE instructor, ID=teaches.ID AND dept_name='Biology';
	
	SELECT name, course_id
		FROM instructor, teaches
		WHERE (instructor.ID,dept_name)=(teaches.ID,'Biology');
		
		SELECT name, course_id
		FROM instructor AS I, teaches AS T
		WHERE (I.ID,I.dept_name)=(T.ID,'Biology');
		
		

		
