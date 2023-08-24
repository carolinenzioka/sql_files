/* 	University Database DDL	*/

	CREATE TABLE  shipments(
		shipment_ID	INTEGER(),
		sales_ID	INTEGER(),
		cust_ID	INTEGER(4,0),
		driver_one_ID INTEGER(),
		driver_two_ID INTEGER(),
		trailer_one_ID INTEGER(),
		trailer_two_ID INTEGER(),
		tractor_ID INTEGER(),
		pickup_date DATE(),
		pickup_time TIME(),
		delivery_date DATE(),
		delivery_time TIME(),
		billed_date DATE(),
		paid_date DATE(),
		origin_address_ID INTEGER(),
		destination_address_ID INTEGER(),
		commodity VARCHAR(),
		last_lat NUMERIC(),
		last_long NUMERIC(),
		latlong_update_time TIME(),
		latlong_update_date DATE(),
		shipment_notes VARCHAR(),

		CONSTRAINT shipments_pkey PRIMARY KEY (shipment_ID)
		CONSTRAINT shipments_fkey FOREIGN KEY (sales_ID,cust_ID,driver_one_ID,driver_two_ID,
			trailer_one_ID,trailer_two_ID,tractor_ID,origin_address_ID,destination_address_ID)
	);

	CREATE TABLE drivers (
		driver_ID	INTEGER(),
		driver_license_number	INTEGER (),
		SSN		INTEGER(12,2),
		first_name VARCHAR(),
		last_name VARCHAR(),
		address_ID VARCHAR(),
		start_date DATE(),
		hourly_rate NUMERIC(),
		email VARCHAR(),
		contact_number VARCHAR(),
		CONSTRAINT drivers_pkey PRIMARY KEY (driver_ID)
		CONSTRAINT divers_fkey FOREIGN KEY (address_ID)
	);

	CREATE TABLE tractors (
		tractor_ID INTEGER(),
		contractor_ID	INTEGER(),
		make varchar(),
		make_year	INTEGER(),
		model VARCHAR(),
		license_tag VARCHAR(),
		license_tag_state VARCHAR(),
		tractor_DOT_number VARCHAR(),
		last_inspected DATE(),
		mileage INTEGER(),
		mileage_date DATE()

		CONSTRAINT tractors_pkey PRIMARY KEY (tractor_id),
		CONSTRAINT tractors_fkey FOREIGN KEY (contractor_ID)
	);

	CREATE TABLE trailers (
		ID			varchar(5),
		name		varchar(20) NOT NULL,
		dept_name	varchar(20),
		salary		numeric(8,2) CHECK (salary > 29000),
		CONSTRAINT instructor_pkey PRIMARY KEY (ID),
		CONSTRAINT instructor_fkey FOREIGN KEY (dept_name) REFERENCES department (dept_name)
			ON DELETE SET NULL
	);

	CREATE TABLE sales_persons (
		sales_ID		INTEGER(),
		man_ID 	INTEGER(),
		ssn INTEGER(),
		first_name VARCHAR(),
		last_name VARCHAR(),
		address_ID INTEGER(),
		start_date DATE(),
		salary NUMERIC(),
		email VARCHAR(),
		contact_number VARCHAR(),
		CONSTRAINT sales_persons_pkey PRIMARY KEY (sales_ID),
		CONSTRAINT sales_persons_fkey FOREIGN KEY (address_ID)

		);

	CREATE TABLE location_checkins (
		shipment_ID			INTEGER(5),
		latitude 				NUMERIC(),
		longitude 	NUMERIC(),
		latlong_update_date TIME(),
		latlong_update_date DATE(),
		CONSTRAINT location_checkins_pkey PRIMARY KEY(shipment_ID)
	);

	CREATE TABLE customers (
		cust_ID			INTEGER(),
		customer_name		VARCHAR(20),
		business_name	VARCHAR(20),
		address_ID	INTEGER(),
		cust_notes VARCHAR(),
		CONSTRAINT customers_pkey PRIMARY KEY (cust_ID),
		CONSTRAINT customers_fkey FOREIGN KEY (address_ID)
	);

	CREATE TABLE customer_contact_numbers (
		cust_ID INTEGER
		cust_phone INTEGER
		phone_type VARCHAR()
		CONSTRAINT customers_contact_pkey PRIMARY KEY (cust_contact_ID)
		CONSTRAINT customers_contact_fkey FOREIGN KEY (cust_contact_ID)


	);

	CREATE TABLE customer_emails (
		cust_ID INTEGER
		cust_email VARCHAR()
		email_rank INTEGER
		CONSTRAINT customers_email_pkey PRIMARY KEY (cust_email_ID)
		CONSTRAINT customers_email_fkey FOREIGN KEY (cust_email_ID)
	);

	CREATE TABLE addresses (
		time_slot_id	varchar(4),
		day				varchar(1),
		start_hr		numeric(2) CHECK (start_hr >= 0 and start_hr < 24),
		start_min		numeric(2) CHECK (start_min >= 0 and start_min < 60),
		end_hr			numeric(2) CHECK (end_hr >= 0 and end_hr < 24),
		end_min			numeric(2) CHECK (end_min >= 0 and end_min < 60),
		CONSTRAINT time_slot_pkey PRIMARY KEY (time_slot_id, day, start_hr, start_min)
	);

	CREATE TABLE contractors (
		course_id	varchar(8),
		prereq_id	varchar(8),
		CONSTRAINT prereq_pkey PRIMARY KEY (course_id, prereq_id),
		CONSTRAINT prereq_fkey_1 FOREIGN KEY (course_id) REFERENCES course (course_id)
			ON DELETE CASCADE,
		CONSTRAINT prereq_fkey_2 FOREIGN KEY (prereq_id) REFERENCES course (course_id)
	);

	CREATE TABLE contractor_emails (
		course_id	varchar(8),
		prereq_id	varchar(8),
		CONSTRAINT prereq_pkey PRIMARY KEY (course_id, prereq_id),
		CONSTRAINT prereq_fkey_1 FOREIGN KEY (course_id) REFERENCES course (course_id)
			ON DELETE CASCADE,
		CONSTRAINT prereq_fkey_2 FOREIGN KEY (prereq_id) REFERENCES course (course_id)
	);

	CREATE TABLE contractor_contact_numbers (
		course_id	varchar(8),
		prereq_id	varchar(8),
		CONSTRAINT prereq_pkey PRIMARY KEY (course_id, prereq_id),
		CONSTRAINT prereq_fkey_1 FOREIGN KEY (course_id) REFERENCES course (course_id)
			ON DELETE CASCADE,
		CONSTRAINT prereq_fkey_2 FOREIGN KEY (prereq_id) REFERENCES course (course_id)
	);
