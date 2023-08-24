--------------------------------------------------------------
/*					  	Nested Subqueries		  			*/
--------------------------------------------------------------

/*	Note: WATCH OUT FOR COPYING AND PASTING! Single quotes can throw errors!	*/



-- Set Membership

	--	Query: “Find all courses taught in both the Fall 2009 and Spring 2010 semesters."

		--	Previous SQL Query Using Set Intersection



		--	Same Query Rewritten Using IN Connective and Subquery



	--	Query: “Find the names of all instructors other than those named Mozart or Einstein.”



	/* 	Query: “Find the total number of (distinct) students who have taken course sections
		taught by the instructor with the ID 34175.”	*/



-- Set Comparison

	/*	SQL allows the following comparisons: < SOME, <= SOME, >= SOME, = SOME, <> SOME,
		> ALL, < ALL, <= ALL, >= ALL, = ALL, and <> ALL. 	*/

	/* 	Query: “Find the names of all instructors who salary is greater than at least
		one instructor in the Biology department.”	*/

		-- We previously wrote this SQL query as follows:



		/*	We can rewrite this SQL query in a form that resembles English more closely
			using the SOME comparison operator:		*/



	/*	Query: “Find the names of all instructors that have a salary value greater than
		that of each instructor in the Biology department.”		*/


	--	Query: “Find the departments that have the highest average salary.”



--	Testing for Empty Relations

	--	Query: “Find all courses taught in both the Fall 2009 semester and in the Spring 2010 semester.”



	/* 	Query: “Find the total number of (distinct) students who have taken course sections
		taught by the instructor with the ID 34175.”	*/

		--	Previously, we wrote:



		-- Now, we can write:



--	Testing for the Absence of Duplicate Tuples

	--	Query: “Find all courses that were offered at most once in 2017.”



--	Subqueries in the FROM Clause

	/*	Query: “Find the average instructors’ salaries of those departments where the
		average salary is greater than $42,000.”	*/

		--	Previously, we wrote this query as:



		--	Now, we can write this query as:



		--	Note that we must alias subqueries in the FROM clause (i.e. error w/o "foobar"):



		/*	Query: “Find the maximum across all departments of the total of all
			instructors’ salaries in each department.”		*/



--	The WITH Clause

	/*	Query: “Find the names and budgets of departments with the maximum budget
		(there could be more than one department with the maximum budget).”		*/



	/*	Query: “Find all departments where the total salary is greater than the
		average of the total salary at all departments.”		*/



--	Scalar Subqueries

	/*	Query: “Find the names of all departments along with the number of
		instructors in each department.”	*/



--	Scalar Subqueries Without a From Clause

	/*	Query: “Find the average number of sections taught per instructor
		(regardless of year or semester); sections taught by multiple instructors
		count once per instructor.”		*/

		
