/* Logistics Company DDL */

CREATE TABLE IF NOT EXISTS locations
(
	loc_id			INTEGER,
	loc_name	VARCHAR(30),
	loc_city	VARCHAR(30),
	CONSTRAINT location_pkey PRIMARY KEY (loc_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS customers
(
	cust_id		INTEGER,
	cust_name			VARCHAR(30),
	cust_street			VARCHAR(30),
	cust_city 		VARCHAR(20),

	CONSTRAINT customers_pkey PRIMARY KEY (cust_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS loan_accounts
(
	loan_ID		INTEGER,
	loc_ID 		INTEGER,
	loan_amount		NUMERIC(10,2),------should be numeric because the data has decimal points
	CONSTRAINT loan_accounts_pkey PRIMARY KEY (loan_ID),
	CONSTRAINT loan_accounts_fkey FOREIGN KEY (loc_ID) REFERENCES locations (loc_ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS borrowers
(
	cust_ID	INTEGER,
	loan_ID		INTEGER,

	CONSTRAINT borrowers_pkey PRIMARY KEY (cust_ID,loan_ID),
	CONSTRAINT borrowers_fkey FOREIGN KEY (cust_ID) REFERENCES customers (cust_ID)
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
	CONSTRAINT rewardees_fkey_1 FOREIGN KEY (cust_ID) REFERENCES customers (cust_ID)

		ON UPDATE CASCADE
		ON DELETE CASCADE
);
