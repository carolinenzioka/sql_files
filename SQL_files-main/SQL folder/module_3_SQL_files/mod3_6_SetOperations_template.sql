--------------------------------------------------------------
/*						Set Operations		  				*/
--------------------------------------------------------------

-- Note: We will use the university_large database for this example.

/*	We will use the following two sets for our discussion of the UNION,
	INTERSECT, and EXCEPT operations:		*/

	--	The set of all courses taught in the Fall 2009 semester.
	SELECT course_id
	FROM section
	WHERE year= 2009 AND semester='FALL';
	



	--	The set of all courses taught in the Spring 2010 semester.

		SELECT course_id
		FROM section
		WHERE year= 2010 AND semester='Spring';
-- The Union Operation

	/*	Query: "Find the set of all courses taught in Fall 2009, or in Spring 2010, or in both."	*/
	(SELECT course_Id
	 FROM section
	 Where year=2009 AND semester='Fall'
	)
	UNION ALL
	(SELECT course_id
	FROM section
	WHERE year=2010 AND semester='Spring');


-- The Intersect Operation

	/*	Query: "Find the set of all courses taught in both Fall 2009 and Spring 2010."	*/

	(SELECT course_id
	 FROM section
	 WHERE year=2009 AND semester='Fall')
	 INTERSECT
	 (SELECT course_id
	 FROM section
	 WHERE year= 2010 AND semester='Spring');
	 
	 (SELECT course_id
	 FROM section
	 WHERE year=2009 AND semester='Fall')
	 INTERSECT ALL
	 (SELECT course_id
	 FROM section
	 WHERE year= 2010 AND semester='Spring');

-- The Except Operation

	/*	Query: "Find the set of all courses taught in Fall 2009 but not in Spring 2010."	*/
	(SELECT course_id
	 FROM section
	 WHERE year=2009 AND semester='Fall')
	 EXCEPT
	 (SELECT course_id
	 FROM section
	 WHERE year= 2010 AND semester='Spring');
	 
	 (SELECT course_id
	 FROM section
	 WHERE year=2009 AND semester='Fall')
	 EXCEPT ALL--does not remove set duplicates
	 (SELECT course_id
	 FROM section
	 WHERE year= 2010 AND semester='Spring');
	 
	 
	 
	 
	)
		
