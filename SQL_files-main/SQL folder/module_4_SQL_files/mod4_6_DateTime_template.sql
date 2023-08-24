--------------------------------------------------------------
/*		            Date and Time Data Types           		*/
--------------------------------------------------------------

/* A few data types for specifying dates and times:

	1)	DATE: A calendar date containing a (four-digit) year, month, and day of the month
	2)	TIME: The time of day, in hours, minutes, and seconds.  A variant, TIME(p),
		can be used to specify the number of fractional digits for seconds
		(the default being 0).  It is also possible to store time-zone information
		along with the time by specifying TIME WITH TIMEZONE.
	3)	TIMESTAMP: A combination of DATE and TIME.  A variant, TIMESTAMP(p) can
		be used to specify the number of fractional digits for seconds
		(the default being 6).  Time-zone information is also stored if
		WITH TIMEZONE is specified.

	--	Date and time values can be specified like this:

		DATE ‘2018-04-25’
		TIME ‘09:30:00’
		TIMESTAMP ‘2018-04-25 10:29:01.45’
*/

--	Create Example Table

	CREATE TABLE testing_time (
		date_1 DATE,
		date_2 DATE,
		time_1 TIME,
		time_2 TIME,
		interval_1 INTERVAL
	);

--	Insert Example Values


-- 	Get Current Date and/or Time


--	EXTRACT Operation

	-- General Form:  EXTRACT(field FROM data_value)

	

-- 	Example Arithmetic and Comparison Operations



--	Scalar SELECT Statements



--	Example: Regular String Value
