-------------------------------------------------------------------
/* -------------------- Introduction to SQL -------------------- */
-------------------------------------------------------------------

------------------------- Create Database -------------------------
-- CREATE DATABASE database_name;

CREATE DATABASE testing_DB;

-------------------------- Drop Database --------------------------
-- DROP DATABASE database_name;

DROP DATABASE testing_DB;


--------------------------- Create Table --------------------------
/* CREATE TABLE table_name	(attribute_1 data_type_1,
							attribute_2 data_type_2,
							...
							attribute_n data_type_n,
							<integrity_constraint_1>,
							<...>,
							<integrity_constraint_m>); */

							CREATE TABLE instructor(
								ID			VARCHAR(5),
								name		VARCHAR(20),
								dept_name 	VARCHAR(20),
								salary		NUMERIC(8,2)

							);

--------------------------- Drop Table ----------------------------
-- DROP TABLE table_name;

DROP TABLE instructor

------------------- Inserting Tuples into Tables ------------------
/* INSERT INTO table_name (att_1, ..., att_n)
   VALUES 	(value_1, ..., value_n);	*/
   
   INSERT INFO instructor(ID,name,dept_name,salary);
   Values('99999','Fred Flinstone','Comp.Sci.',100000.00);
   
   INSERT INFO instructor(ID,name,dept_name,salary)
   Values('88888','Fred Flinstone','Comp.Sci.',100000.00);

	INSERT INFO instructor(ID,name,dept_name,salary)
   Values('88888','Fred Flinstone','Comp.Sci.',100000.00);
   
	 INSERT INFO instructor(ID,name,dept_name,salary)
	 Values('Bam-bam Rubble','Comp.Sci.',100000.00);



------------------- Deleting Tuples from Tables -------------------
-- DELETE FROM table_name;

	DELETE FROM instructor;

	DELETE
	FROM instructor
	WHERE name = 'Fred Flinstone';
	
	SELECT *
	FROM instructor;
	

------------- Create Table with Primary Key Constraint ------------
-- CONSTRAINT consName PRIMARY KEY ( attName_1, …, attName_n )
CREATE TABLE instructor
(
	ID			VARCHAR(5),
	name		VARCHAR(20),
	drop_name	VARCHAR(20),
	salary		numeric(8,2),
	CONSTRAINT instructor_pkey PRIMARY KEY(ID)


);



------------- Create Table with Foreign Key Constraint ------------
/* CONSTRAINT consName FOREIGN KEY (local_att(s))
   REFERENCES foreign_table (foreign_att(s))	*/
CREATE TABLE instructor
(
	course_id		VARCHAR(8),
	title			VARCHAR(50),
	dept_name		VARCHAR(20),
	credits			NUMERIC(2,0),
	CONSTRAINT course_pkey PRIMARY(course_id)

);
CREATE TABLE classroom
(
	building 	VARCHAR(15),
	room_number	VARCHAR(7),
	capacity NUMERIC(4,0),
	CONSTRAINT classroom_pkey PRIMARY KEY (building,room_number)
	
);

CREATE TABLE section
(
	course_id		VARCHAR(8),
	sec_id 			VARCHAR(8),
	semester		VARCHAR(6),
	year			NUMERIC(4,0),
	building 		VARCHAR(15),
	room_number		VARCHAR(7),
	time_slot_id	VARCHAR(4),
	CONSTRAINT section_pkey PRIMARY KEY (course_id, sec_id, semester,year),
	CONSTRAINT section_fkey_1 FOREIGN KEY(course_id) REFERENCES course(course_id)
		ON DELETE CASCADE,
	CONSTRAINT section_fkey_2 FOREIGN KEY(building,room_number) REFERENCES classroom(building,room_number)
		ON DELETE SET NULL
);


/*
		ON DELETE CASCADE
		ON DELETE SET NULL
		ON DELETE SET DEFAULT

		ON UPDATE CASCADE
		ON UPDATE SET NULL
		ON UPDATE SET DEFAULT

*/


----------------------- Not Null Constraint -----------------------
-- attributeName dataType NOT NULL
CREATE TABLE instructor
(
	ID			VARCHAR(5),
	name		VARCHAR(20) CONSTRAINT insNotNull NOT NULL,
	drop_name	VARCHAR(20),
	salary		numeric(8,2),
	CONSTRAINT instructor_pkey PRIMARY KEY(ID)


);




----------------------- Check Constraints -------------------------

CREATE TABLE department
(
dept_name		VARCHAR(8),
building		VARCHAR(15),
budget			NUMERIC(12,2) CONSTRAINT positiveBudget CHECK (budget>0.00)
)


CREATE TABLE section
(
	course_id		VARCHAR(8),
	sec_id 			VARCHAR(8),
	semester		VARCHAR(6)
	CONSTRAINT semesterCheck CHECK(semester IN('Fall','Winter','Spring','Summer')),
	year			NUMERIC(4,0),
	building 		VARCHAR(15),
	room_number		VARCHAR(7),
	time_slot_id	VARCHAR(4),
	CONSTRAINT section_pkey PRIMARY KEY (course_id, sec_id, semester,year),
	CONSTRAINT section_fkey_1 FOREIGN KEY(course_id) REFERENCES course(course_id)
		ON DELETE CASCADE,
	CONSTRAINT section_fkey_2 FOREIGN KEY(building,room_number) REFERENCES classroom(building,room_number)
		ON DELETE SET NULL
);



------------------- Default Attribute Values ----------------------
CREATE TABLE student
(
	ID 		VARCHAR(5),
	name	VARCHAR(20) NOT NULL,
	dept_name	VARCHAR(20) DEFAULT 'Exploratory Studies',
	tot_cred	NUMERIC(3,0) DEFAULT 0

);


----------------------- Updating Relations ------------------------
/* UPDATE 	table_name
   SET		condition/action
   WHERE 	predicate;	*/

INSERT INTO student (ID,name,dept_name,tot_cred)
VALUES ('987685','John Cena', NULL,0);

UPDATE student
SET dept_name ='Physics'
WHERE name= 'John Cena';

----------------------- Altering Relations ------------------------
/* ALTER TABLE table_name ADD att_name data_type;
   ALTER TABLE table_name DROP attribute_name;

   ALTER TABLE table_name ADD constraintName
   ALTER TABLE table_name DROP constraintName	*/
ALTER TABLE  student ADD faveIceCream VARCHAR(20);
ALTER TABLE student DROP favIceCream;

ALTER TABLE  student ADD CONSTRAINT iceCreamCheck CHECK
	(favIceCream IN('Chocolate', 'Vanilla'));
	
ALTER TABLE student DROP CONSTRAINT iceCreamCheck;





