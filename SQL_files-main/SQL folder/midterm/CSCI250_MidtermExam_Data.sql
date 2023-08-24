-- CSCI250 --
-- Midterm Exam Data --

-- Insert Values into locations --

INSERT INTO locations (loc_ID, loc_name, loc_city)
VALUES (12345, 'Brooklyn Home Depot','Brooklyn');

INSERT INTO locations (loc_ID, loc_name, loc_city)
VALUES (54321, 'First Home Depot of Brooklyn','Brooklyn');

INSERT INTO locations (loc_ID, loc_name, loc_city)
VALUES (74185, 'Brooklyn Bridge Home Depot','Brooklyn');

INSERT INTO locations (loc_ID, loc_name, loc_city)
VALUES (36925, 'Bronx Home Depot','Bronx');

INSERT INTO locations (loc_ID, loc_name, loc_city)
VALUES (98765, 'Home Depot of the Bronx','Bronx');

INSERT INTO locations (loc_ID, loc_name, loc_city)
VALUES (45678, 'Upper East Home Depot','Manhatten');

INSERT INTO locations (loc_ID, loc_name, loc_city)
VALUES (73195, 'Yonkers Home Depot','Yonkers');

-- Insert Values into customers --

INSERT INTO customers (cust_ID, cust_name, cust_street, cust_city)
VALUES ('12345', 'Billy Boi', '123 Easy Street', 'Bronx');

INSERT INTO customers (cust_ID, cust_name, cust_street, cust_city)
VALUES ('54321', 'Teddy Tiger', '56 East Baltimore Road', 'Brooklyn');

INSERT INTO customers (cust_ID, cust_name, cust_street, cust_city)
VALUES ('98524', 'Betty Bench', '123 Easy Street', 'Bronx');

INSERT INTO customers (cust_ID, cust_name, cust_street, cust_city)
VALUES ('24357', 'Walter Halter', '67 Stupid Street', 'Brooklyn');

INSERT INTO customers (cust_ID, cust_name, cust_street, cust_city)
VALUES ('73194', 'Wendy Winks', '78 Gold Street', 'Harrison');

INSERT INTO customers (cust_ID, cust_name, cust_street, cust_city)
VALUES ('74185', 'Lauren Lawn', '3 Gravy Avenue', 'Yonkers');

INSERT INTO customers (cust_ID, cust_name, cust_street, cust_city)
VALUES ('95124', 'Peter Pretender', '85 West Fourth Road', 'Manhattan');

INSERT INTO customers (cust_ID, cust_name, cust_street, cust_city)
VALUES ('86753', 'Susan Sits', '123 Easy Street', 'Bronx');

INSERT INTO customers (cust_ID, cust_name, cust_street, cust_city)
VALUES ('77776', 'Hank Handles', '2 Ford Drive', 'Harrison');

-- Insert Values into loan_accounts

INSERT INTO loan_accounts (loan_ID, loc_ID, loan_amount)
VALUES ('462882645', 74185, '7500.00');

INSERT INTO loan_accounts (loan_ID, loc_ID, loan_amount)
VALUES ('888512347', 36925, '11500.00');

INSERT INTO loan_accounts (loan_ID, loc_ID, loan_amount)
VALUES ('646469321', 45678, '8550.00');

INSERT INTO loan_accounts (loan_ID, loc_ID, loan_amount)
VALUES ('774485962', 73195, '2000.00');

INSERT INTO loan_accounts (loan_ID, loc_ID, loan_amount)
VALUES ('919137375', 54321, '5000.00');

-- Insert Values into borrowers

INSERT INTO borrowers (cust_ID, loan_ID)
VALUES ('54321','888512347');

INSERT INTO borrowers (cust_ID, loan_ID)
VALUES ('95124','888512347');

INSERT INTO borrowers (cust_ID, loan_ID)
VALUES ('24357','919137375');

INSERT INTO borrowers (cust_ID, loan_ID)
VALUES ('77776','462882645');

INSERT INTO borrowers (cust_ID, loan_ID)
VALUES ('98524','774485962');

-- Insert Values into reward_accounts

INSERT INTO reward_accounts (account_ID, loc_ID, reward_balance)
VALUES ('142375689', 54321, '2003.64');

INSERT INTO reward_accounts (account_ID, loc_ID, reward_balance)
VALUES ('741852963', 73195, '5263.23');

INSERT INTO reward_accounts (account_ID, loc_ID, reward_balance)
VALUES ('159263487', 74185, '1425.98');

INSERT INTO reward_accounts (account_ID, loc_ID, reward_balance)
VALUES ('963852741', 45678, '2598.36');

INSERT INTO reward_accounts (account_ID, loc_ID, reward_balance)
VALUES ('846275315', 74185, '688.12');

INSERT INTO reward_accounts (account_ID, loc_ID, reward_balance)
VALUES ('258258963', 36925, '3256.21');

INSERT INTO reward_accounts (account_ID, loc_ID, reward_balance)
VALUES ('232154689', 98765, '4152.87');

INSERT INTO reward_accounts (account_ID, loc_ID, reward_balance)
VALUES ('222456197', 36925, '1234.56');

INSERT INTO reward_accounts (account_ID, loc_ID, reward_balance)
VALUES ('774436581', 54321, '8259.34');

-- Insert Values into rewardees

INSERT INTO rewardees (cust_ID, account_ID)
VALUES ('77776', '774436581');

INSERT INTO rewardees (cust_ID, account_ID)
VALUES ('24357', '222456197');

INSERT INTO rewardees (cust_ID, account_ID)
VALUES ('86753', '232154689');

INSERT INTO rewardees (cust_ID, account_ID)
VALUES ('74185', '258258963');

INSERT INTO rewardees (cust_ID, account_ID)
VALUES ('12345', '142375689');

INSERT INTO rewardees (cust_ID, account_ID)
VALUES ('73194', '741852963');

INSERT INTO rewardees (cust_ID, account_ID)
VALUES ('12345', '846275315');

INSERT INTO rewardees (cust_ID, account_ID)
VALUES ('77776', '963852741');

INSERT INTO rewardees (cust_ID, account_ID)
VALUES ('12345', '159263487');
