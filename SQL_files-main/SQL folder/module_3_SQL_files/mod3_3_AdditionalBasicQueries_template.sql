------------------------------------------------------------
/*				   Additional Basic Queries			  	  */
------------------------------------------------------------

--	The Rename Operation (The AS Clause)

	/*	Query: “For all instructors in the university who have taught some course,
	find their names and the course ID of all courses they taught.”	*/

		

	/*	Query: “Find the names of all instructors whose salary is greater than at
	least one instructor in the Biology department.”

	Same Query, Better English: “Find the names of all instructors who earn
	more than the lowest paid instructor in the Biology department.”	*/

		

--	String Operations

	/* 	Example: Strings are specified by single quotes.  To include as string containing
		a single quote, use two quotes:		*/

		

	-- 	Example: Equality of Strings

		

	-- 	Example: String Concatenation

		

	/* 	Note: String concatenation is more useful in the SELECT clause, which will
		be asked of you for a homework problem.	 */

	-- 	Example: Substring Extraction

		

	-- 	Example: Case Conversion

		

	-- 	Example: String Length Determination

		

	-- 	Example: Empty Space Truncation

		

-- 	Pattern Matching

	/* 	General Form: 	SELECT *
						FROM table
						WHERE string LIKE pattern;	*/

	/*	Two Special Characters:		% and _
		Three Special Operators:	LIKE, ILIKE, SIMILAR TO		*/

		

	--	Example: LIKE, ILIKE, SIMILAR TO Operators

		/*	‘Intro%’ 	matches any string beginning with ‘Intro’
			‘%Comp%’ 	matches any string containing ‘Comp’
			‘_ _ _’ 	matches any string of exactly three characters
			‘_ _ _%’ 	matches any string of at least three characters		*/

		

	--	Query: "Find all instructors that have an 'a' in their name, either capital or lowercase."

		

	/*	General Form:	string SIMILAR TO pattern [ESCAPE ‘escape_character’]
						string NOT SIMILAR TO pattern [ESCAPE ‘escape_character’]

		The escape_character is used if the string being searched for contains either
		of the special characters, %, _, or /.		*/

		
