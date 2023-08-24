--------------------------------------------------------------
/*		  Generating Unique Key Values and Sequences        */
--------------------------------------------------------------

--  The SERIAL Data Type



--	Sequences

    /*
        Information about sequences can be found at:
        https://www.postgresql.org/docs/9.5/sql-createsequence.html
    */

    

    CREATE TABLE talent_agents (
    	ID INTEGER,
    	name VARCHAR(30),
    	company VARCHAR(30),
    	CONSTRAINT talent_agents_pkey PRIMARY KEY (ID)
    );

    CREATE TABLE talent_clients (
    	ID INTEGER,
    	name VARCHAR(30),
    	talent VARCHAR(30),
    	CONSTRAINT talent_clients_pkey PRIMARY KEY (ID)
    );

    INSERT INTO talent_agents (ID, name, company)
    VALUES (, 'Mary', 'Mary''s Got Talent');

    INSERT INTO talent_clients (ID, name, talent)
    VALUES (, 'Samantha', 'Juggling');


    INSERT INTO talent_agents (ID, name, company)
    VALUES (, 'Peter', 'Mary''s Got Talent');

    INSERT INTO talent_clients (ID, name, talent)
    VALUES (, 'Paul', 'Breathing Fire');

    -- Selection Option I


	-- Selection Option II
