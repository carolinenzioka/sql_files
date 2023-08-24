--------------------------------------------------------------
/*						 Null Values		  				*/
--------------------------------------------------------------

-- Unknown Values

	SELECT (1<NULL);
	SELECT NOT(1<NULL);
	
	SELECT 45+7;

	

	/*	We must extend the logical connectives AND, OR, and NOT to
		include unknown (i.e. NULL) values.		*/

-- Testing For Null Values

	/*	Query: “Find the names of all instructors who have a null
		value for their salary.”	*/
		
		SELECT name
		FROM instructor
		WHERE salary IS NULL;
		
		
		

	/*	Query: “Find the names of all instructors who have a nonnull
		value for their salary attribute.”		*/

		SELECT name
		FROM instructor
		WHERE salary IS NOT NULL;
		





















