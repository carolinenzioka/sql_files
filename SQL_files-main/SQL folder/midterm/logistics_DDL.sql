/* Logistics Company DDL */

CREATE TABLE IF NOT EXISTS addresses
(
	address_id			INTEGER,
	address_line_one	VARCHAR(30),
	address_line_two	VARCHAR(30),
	city				VARCHAR(15),
	state				VARCHAR(15),
	zip					VARCHAR(15),
	country				VARCHAR(15),
	CONSTRAINT address_pkey PRIMARY KEY (address_id)
);

CREATE TABLE IF NOT EXISTS sales_persons
(
	sales_id		INTEGER,
	man_id 			INTEGER,
	ssn				INTEGER,
	first_name 		VARCHAR(20) NOT NULL,
	last_name 		VARCHAR(20) NOT NULL,
	address_id		INTEGER,
	start_date		DATE,
	salary			NUMERIC(10,2) CHECK (salary > 0.00 AND salary < 300000.00),
	email 			VARCHAR(30),
	contact_number 	VARCHAR(11),
	CONSTRAINT sales_person_pkey PRIMARY KEY (sales_id),
	CONSTRAINT sales_person_fkey1 FOREIGN KEY (man_id) REFERENCES sales_persons (sales_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT sales_person_fkey2 FOREIGN KEY (address_id) REFERENCES addresses (address_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS contractors
(
	contractor_id	INTEGER,
	first_name		VARCHAR(15) NOT NULL,
	last_name		VARCHAR(15) NOT NULL,
	address_id		INTEGER,
	CONSTRAINT contractor_pkey PRIMARY KEY (contractor_id),
	CONSTRAINT contractor_fkey FOREIGN KEY (address_id) REFERENCES addresses (address_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS customers
(
	cust_id			INTEGER,
	customer_name 	VARCHAR(30) NOT NULL,
	business_name 	VARCHAR(30) NOT NULL,
	address_id 		INTEGER,
	cust_notes		VARCHAR(30),
	CONSTRAINT customer_pkey PRIMARY KEY (cust_id),
	CONSTRAINT customer_fkey FOREIGN KEY (address_id) REFERENCES addresses (address_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS drivers
(
	driver_id				INTEGER,
	driver_license_number	INTEGER,
	ssn						INTEGER,
	first_name				VARCHAR(20) NOT NULL,
	last_name				VARCHAR(20) NOT NULL,
	address_id				INTEGER,
	start_date				DATE,
	hourly_rate				NUMERIC(5,2),
	email					VARCHAR(30),
	contact_number			INTEGER,
	CONSTRAINT drivers_pkey PRIMARY KEY (driver_id),
	CONSTRAINT drivers_fkey FOREIGN KEY (address_id) REFERENCES addresses (address_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS trailers
(
	trailer_id			INTEGER,
	contractor_id		INTEGER,
	make				VARCHAR(15),
	make_year			INTEGER,
	model 				VARCHAR(20),
	trailer_DOT_number	VARCHAR(30),
	trailer_length		INTEGER,
	trailer_group		VARCHAR(20),
	last_inspected		DATE,
	mileage				INTEGER,
	mileage_date		DATE,
	CONSTRAINT trailer_pkey PRIMARY KEY (trailer_id),
	CONSTRAINT trailer_fkey FOREIGN KEY (contractor_id) REFERENCES contractors (contractor_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tractors
(
	tractor_id			INTEGER,
	contractor_id		INTEGER,
	make				VARCHAR(15),
	make_year			INTEGER,
	model 				VARCHAR(20),
	license_tag			VARCHAR(30),
	license_tag_state	VARCHAR(20),
	tractor_DOT_number	VARCHAR(20),
	last_inspected		DATE,
	mileage				INTEGER,
	mileage_date		DATE,
	CONSTRAINT tractors_pkey PRIMARY KEY (tractor_id),
	CONSTRAINT tractors_fkey FOREIGN KEY (contractor_id) REFERENCES contractors (contractor_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS shipments 
(
	shipment_ID				INTEGER,
	sales_ID 				INTEGER,
	cust_ID 				INTEGER,
	tractor_ID				INTEGER,
	driver_one_ID 			INTEGER,
	driver_two_ID 			INTEGER,
	trailer_one_ID 			INTEGER,
	trailer_two_ID 			INTEGER,
	pickup_date				DATE,
	pickup_time				TIME,
	delivery_date 			DATE,
	delivery_time 			TIME,
	billed_date				DATE,
	paid_date				DATE,
	origin_address_ID 		INTEGER,
	destination_address_ID 	INTEGER,
	location_checkin_ID 	INTEGER,
	commodity 				VARCHAR(20),
	last_long 				NUMERIC(5,2),
	last_lat 				NUMERIC(5,2),
	latlong_update_time 	TIME,
	latlong_update_date 	DATE,
	shipment_notes 			VARCHAR(30),
	CONSTRAINT shipment_pkey PRIMARY KEY (shipment_ID),
	CONSTRAINT shipment_fkey_1 FOREIGN KEY (sales_ID) REFERENCES sales_persons (sales_ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT shipment_fkey_2 FOREIGN KEY (cust_ID) REFERENCES customers (cust_ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT shipment_fkey_3 FOREIGN KEY (driver_one_ID) REFERENCES drivers (driver_ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT shipment_fkey_4 FOREIGN KEY (driver_two_ID) REFERENCES drivers (driver_ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT shipment_fkey_5 FOREIGN KEY (trailer_one_ID) REFERENCES trailers (trailer_ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT shipment_fkey_6 FOREIGN KEY (trailer_two_ID) REFERENCES trailers (trailer_ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT shipment_fkey_7 FOREIGN KEY (tractor_ID) REFERENCES tractors (tractor_ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT shipment_fkey_8 FOREIGN KEY (origin_address_ID) REFERENCES addresses (address_ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT shipment_fkey_9 FOREIGN KEY (destination_address_ID) REFERENCES addresses (address_ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS customer_contact_numbers
(
	cust_ID		INTEGER,
	cust_phone	INTEGER,
	phone_type 	VARCHAR(10),
	CONSTRAINT customer_contact_numbers_pkey PRIMARY KEY (cust_ID, cust_phone),
	CONSTRAINT customer_contact_numbers_fkey FOREIGN KEY (cust_ID) REFERENCES customers (cust_ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS contractor_contact_numbers
(
	contractor_ID		INTEGER,
	contractor_phone	INTEGER,
	phone_type 			VARCHAR(10),
	CONSTRAINT contractor_contact_numbers_pkey PRIMARY KEY (contractor_ID, contractor_phone),
	CONSTRAINT contractor_contact_numbers_fkey FOREIGN KEY (contractor_ID) REFERENCES contractors (contractor_ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS customer_emails
(
	cust_ID 	INTEGER,
	cust_email	VARCHAR(30),
	email_rank 	INTEGER,
	CONSTRAINT customer_emails_pkey PRIMARY KEY (cust_ID, cust_email),
	CONSTRAINT customer_emails_fkey FOREIGN KEY (cust_ID) REFERENCES customers (cust_ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS contractor_emails
(
	contractor_ID 		INTEGER,
	contractor_email	VARCHAR(30),
	email_rank 			INTEGER,
	CONSTRAINT contractor_emails_pkey PRIMARY KEY (contractor_ID, contractor_email),
	CONSTRAINT contractor_emails_fkey FOREIGN KEY (contractor_ID) REFERENCES contractors (contractor_ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);


