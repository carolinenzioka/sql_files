--------------------------------------------------------------
/*		        Type Conversions and Formatting             */
--------------------------------------------------------------

--  The CAST Function

    /*
        General Form:
        CAST(expression AS type)
    */

    /*  Query: "Obtain a list of instrctor IDs and names ordered by the ID number."  */

        --  Incorrect Query


        --  Correct Query


    -- Other Examples of CAST Function

        -- Example 1


        -- Example 2


        -- Example 3


--  Other Conversion Functions

    /*
        General Forms:
            to_char(timestamp, text)
            to_char(interval, text)
            to_char(int, text)
            to_char(double precision, text)
            to_char(numeric, text)
            to_number(text, text)
            to_date(text, text)
            to_timestamp(text, text)
    */

    --  TO_CHAR()

        --  A Simple Example



        --  A More Complicated Example

            CREATE TABLE payTable (
            first_name		CHAR(30),
            last_name		CHAR(30),
            amount			numeric,
            payment_date	TIMESTAMP
            );

            INSERT INTO payTable
            VALUES ('Derrin', 'Doe', 2378.00, '9/20/2020 8:32:00');

            INSERT INTO payTable
            VALUES ('Jain', 'Strain', 5678.75, '9/25/2020 16:27:00');

            INSERT INTO payTable
            VALUES ('Peter', 'Piper', 3454.87, '9/27/2020 13:08:00');



    --  TO_NUMBER()



    --  TO_DATE()



    /*
        More information about these conversion functions can be found at:
        https://www.postgresql.org/docs/11/functions-formatting.html
    */

--  The ROUND Function



--  The COALESCE Function

    /*
        General Form:
        COALESCE(argument_1, argument_2, …);
    */

    --  A Simple Example:



    --  Query: “Display all instructors' IDs and salaries, but show null values as 0.”

    -- First, insert an instructor with a null salary
