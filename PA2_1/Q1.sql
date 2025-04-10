/*
TEAM NAME: Drowsy Duo
TEAM MEMBERS' NAME: Adriean Lemoine, Chris Smith


Instructions
- Descriptions must reflect a business operation's need
- One query for each item (Q..) is enough. E.g.,�for�QD1: CREATE TABLE, write a DDL query to create one of your project's tables. Similar for the others.
- You must use the exact format
- Project a few attributes only unless otherwise said
- Do not change the order of the queries
*/

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ DDL QUERIES   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--QD1: CREATE TABLE ...
/*
Instructions:
- Must define PK
- Must define a default value as needed
*/
----Description: Create the table that will hold customer’s data in order retain contact with customers.

CREATE TABLE customer (
	customer_id INT,
    first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	address VARCHAR(100),
	city VARCHAR(50),
	state CHAR(2),
	license_num CHAR(9),
	last_contact DATE 
		DEFAULT CAST(GETDATE() AS DATE),
	PRIMARY KEY (customer_id)
)

--QD2: ALTER TABLE ...
----Description: Add ability to record customer's phone number as a backup way of communication

ALTER TABLE customer
ADD phone CHAR(10);

--QD3: ADD "CHECK" CONSTRAINT:
----Description: Ensure that a date of the last customer contact is not accidentally recorded as some point in the future.

ALTER TABLE customer
ADD CONSTRAINT chk_last_contact_not_future
CHECK (last_contact <= CAST(GETDATE() AS DATE));

--QD4: ADD FK CONSTRAINT(S) TO THE TABLE
/*
Instructions:
- Must define action
- At least one of the FKs must utilize the default value
*/
----Description: If a salesperson is removed, their past sales are reassigned to a default “System” employee so we don’t lose sales records.

ALTER TABLE sale
ADD CONSTRAINT df_sale_employee
DEFAULT 9999 FOR employee_id;

ALTER TABLE sale
ADD CONSTRAINT fk_sale_employee
FOREIGN KEY (employee_id)
REFERENCES employee(employee_id)
ON DELETE SET DEFAULT
ON UPDATE CASCADE;


--QD5: Create TRIGGER ...
----Description: When a part’s inventory hits the minimum level, it’s automatically restocked to the maximum so we never run out.

GO
-- Create a trigger that performs after an update on the 'part' table
CREATE TRIGGER trg_auto_restock_part
ON part
AFTER UPDATE
AS
BEGIN
    -- Update the part's qty_current to qty_max if qty_current hits the minimum threshold, "restocking the supply"
    UPDATE p
    SET qty_current = p.qty_max  -- Restock to max
    FROM part p
    JOIN inserted i ON p.part_id = i.part_id  -- Use 'inserted' to get recently updated rows
    WHERE i.qty_current = p.qty_min;  -- Only restock if qty_current equals qty_min
END;
GO

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ DML QUERIES   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


--QM1.1: A TEST QUERY FOR THE TRIGGER CREATED in QD5:
----Description: Drop current quantity of part ID 3 to its minimum level to validate that the part is restocked.

UPDATE part
SET qty_current = qty_min
WHERE part_id = 3; 

--QM1.2: A TEST QUERY FOR THE "CHECK" CONSTRAINT DEFINED in QD3:
----Description: Attempt to add a customer with a last contact date in the future, which is supposed to fail.

INSERT INTO customer (
    customer_id, first_name, last_name, email, phone, address, city, state, license_num, last_contact
)
VALUES (
    201, 'Future', 'Test', 'future@test.com', '1234567890',
    '123 Test St', 'Testville', 'TX', 'TX9999999', '2026-01-01'
);


--QM1.3: A TEST QUERY FOR THE FK CONSTRAINT DEFINED in QD4:
----Description: Attempt to add a sale without an employee. The default employee_id 9999 should be applied.

INSERT INTO sale (sale_id, date, customer_id, vehicle_id, car_package, financing_type, sale_price, profit)
VALUES (151, GETDATE(), 1, 1, 'Standard', 'Loan', 20000.00, 8000.00);
