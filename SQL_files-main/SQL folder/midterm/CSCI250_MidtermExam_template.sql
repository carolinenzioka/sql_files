/*
    Name: Roshane Bent
    CSCI250: Databases
    Midterm Exam
    Spring 2022
*/

--------------------------------------------------------------------------------
/*				            Home Depot Finance DDL           		  		  */
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS locations
(
	loc_id			INTEGER,
	loc_name		VARCHAR(30),
	loc_city		VARCHAR(30),
	
	CONSTRAINT location_pkey PRIMARY KEY (loc_id)

);


CREATE TABLE IF NOT EXISTS customers
(
	cust_id				INTEGER,
	cust_name			VARCHAR(30),
	cust_street			VARCHAR(30),
	cust_city 			VARCHAR(20),

	CONSTRAINT customers_pkey PRIMARY KEY (cust_id)
	
);



CREATE TABLE IF NOT EXISTS loan_accounts
(
	loan_ID			INTEGER,
	loc_ID 			INTEGER,
	loan_amount		NUMERIC(10,2),  /*should be numeric because the data has decimal points*/
	
	CONSTRAINT loan_accounts_pkey PRIMARY KEY (loan_ID),
	CONSTRAINT loan_accounts_fkey FOREIGN KEY (loc_ID) REFERENCES locations (loc_ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS borrowers
(
	cust_ID		INTEGER,
	loan_ID		INTEGER,

	CONSTRAINT borrowers_pkey PRIMARY KEY (cust_ID,loan_ID),
	CONSTRAINT borrowers_fkey FOREIGN KEY (cust_ID) REFERENCES customers (cust_ID),
	CONSTRAINT borrowers_fkey_1 FOREIGN KEY (loan_ID) REFERENCES loan_accounts (loan_ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS reward_accounts
(
	account_ID	INTEGER,
	loc_ID		INTEGER,
	reward_balance NUMERIC(15,2),-----should be numeric because the data has decimal points

	CONSTRAINT reward_accounts_pkey PRIMARY KEY (account_ID),
	CONSTRAINT borrowers_fkey FOREIGN KEY (loc_ID) REFERENCES locations (loc_ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS rewardees
(
	account_ID	INTEGER,
	cust_ID		INTEGER,

	CONSTRAINT rewardees_pkey PRIMARY KEY (account_ID,cust_ID),
	CONSTRAINT rewardees_fkey FOREIGN KEY (account_ID) REFERENCES reward_accounts (account_ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	CONSTRAINT rewardees_fkey_1 FOREIGN KEY (cust_ID) REFERENCES customers (cust_ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE

);


--------------------------------------------------------------------------------
/*				                  Part (e)           		  		          */
--------------------------------------------------------------------------------

	SELECT DISTINCT  borrowers.cust_ID, customers.cust_name
	FROM customers,borrowers,rewardees
	WHERE borrowers.cust_ID = customers.cust_ID 
	AND borrowers.cust_ID <> rewardees.cust_ID 
	ORDER BY cust_name ASC;
--------------------------------------------------------------------------------
/*				                  Part (f)           		  		          */
--------------------------------------------------------------------------------

    SELECT DISTINCT cust_ID, cust_name
	FROM customers
	WHERE cust_street = '123 Easy Street' 
	AND cust_city = 'Bronx'
	ORDER BY cust_ID DESCere.

--------------------------------------------------------------------------------
/*				                  Part (g)           		  		          */
--------------------------------------------------------------------------------

    SELECT DISTINCT loc_name
	FROM locations,rewardees,reward_accounts,customers
	WHERE customers.cust_city='Harrison'
	ORDER BY loc_name ASC;

--------------------------------------------------------------------------------
/*				                  Part (h)           		  		          */
--------------------------------------------------------------------------------

  	/*SELECT DISTINCT r.cust_ID, c.cust_name
	FROM rewardees AS r, customers AS c
	INNER JOIN reward_accounts AS ra ON r.account_ID = ra.account_ID 
	INNER JOIN locations l ON ra.loc_ID = l.loc_ID
	WHERE l.loc_city = 'Brooklyn'
	GROUP BY r.cust_ID
	HAVING COUNT(DISTINCT l.loc_city) = 
	(
		SELECT COUNT(loc_city)
		FROM locations
		WHERE loc_city = 'Brooklyn'
	)
	ORDER BY cust_ID ASC; */
	
	
	SELECT DISTINCT customers.cust_ID, cust_name
	FROM locations, customers
	FULL OUTER JOIN rewardees AS r
	ON customers.cust_ID = r.cust_ID
	FULL OUTER JOIN reward_accounts AS ra
	ON ra.account_ID = r.account_ID
	WHERE ra.loc_ID = 12345 AND ra.loc_ID = 54321 AND ra.loc_ID = 74185
	ORDER BY cust_ID ASC;

--------------------------------------------------------------------------------
/*				                  Part (i)           		  		          */
--------------------------------------------------------------------------------

   
	SELECT l.loc_city,SUM(reward_balance)
	FROM reward_accounts ra,locations l
	GROUP BY l.loc_city
	HAVING SUM (reward_balance) > 8000.00
	

--------------------------------------------------------------------------------
/*				                  Part (j)           		  		          */
--------------------------------------------------------------------------------

	SELECT SUM(loan_amount)
	FROM loan_accounts

--------------------------------------------------------------------------------
/*				                  Part (k)           		  		          */
--------------------------------------------------------------------------------

   SELECT 
	CAST(COUNT(account_ID)/ COUNT(cust_ID)AS DECIMAL(7,4))AS decimal_value
	FROM customers,reward_accounts;

--------------------------------------------------------------------------------
/*				                  Part (l)           		  		          */
--------------------------------------------------------------------------------
	SELECT DISTINCT cust_name
	FROM customers AS c, rewardees AS r, reward_accounts AS ra
	WHERE c.cust_ID= r.cust_ID
	AND r.account_ID= ra.account_ID
	AND ra.reward_balance > some
	(
		SELECT reward_balance
		FROM customers AS c,rewardees AS r, reward_accounts AS ra
		WHERE c.cust_city='Bronx'
		AND c.cust_ID=r.cust_ID
		AND r.account_ID=ra.account_ID
	)
	ORDER BY cust_name ASC

--------------------------------------------------------------------------------
/*				                  Part (m)           		  		          */
--------------------------------------------------------------------------------

    	SELECT COUNT (cust_name)
		FROM customers

--------------------------------------------------------------------------------
/*				                  Part (n)           		  		          */
--------------------------------------------------------------------------------
	/*SELECT MAX(loan_amount) AS maximum_loan
	FROM loan_accounts*/
	
	SELECT DISTINCT b.cust_ID, c.cust_name
	FROM loan_accounts AS l,borrowers AS b,customers AS c
	WHERE c.cust_ID = b.cust_ID 
	AND b.loan_ID= l.loan_ID
	AND loan_amount = (SELECT MAX(loan_amount)FROM loan_accounts )