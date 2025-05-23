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


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ DML QUERIES   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--QM2: INSERT DATA:
----Description: Record a new vehicle sale

INSERT INTO sale (
    sale_id,
    customer_id,
    employee_id,
    vehicle_id,
    car_package,
    financing_type,
    sale_price,
    profit
)
VALUES (
    151,
    151,
    13,
    6,
    'Premium',
    'Loan',
    25000.00,
    4500.00
);


--QM3: UPDATE DATA:
----Description: Update customer last_contact date after sending them a personalized email

UPDATE customer
SET last_contact = GETDATE()
WHERE customer_id=1;


--QM4: DELETE DATA:
----Description: Delete a vehicle to make room for new vehicles to order and sell

DELETE 
FROM vehicle
WHERE vehicle_id = 17;


--QM5: QUERY DATA WITH WHERE CLAUSE:
----Description: Identify highly attractive vehicles to be advertised to bring in opportunity to record more vehicle sales.

SELECT vehicle_id, v_model, v_year, mileage, list_price
FROM vehicle
WHERE (v_year > 2023) OR 
      ( (mileage < 20000) AND
        (list_price < 15000) 
      );


--QM6.1: QUERY DATA WITH 'SUB-QUERY IN WHERE CLAUSE':
----Description: Identify customers who have yet to buy a vehicle in order to pursue a sale

SELECT customer_id, first_name, last_name, email
FROM customer
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM sale
);


--QM6.2: QUERY DATA WITH SUB-QUERY IN FROM CLAUSE:
----Description: Determine which parts need to be replenished in storage location D

SELECT d.part_id, d.description, d.qty_current, d.qty_min
FROM (
	SELECT part_id, description, qty_current, qty_min
	FROM part
	WHERE storage_loc = 'D'
) AS d
WHERE d.qty_current <= d.qty_min;


--QM6.3: QUERY DATA WITH 'SUB-QUERY IN SELECT CLAUSE':
----Description: Determine each customer's last service date to know when they should be sent an email reminder of future service

SELECT customer_id,first_name, last_name, email,(
	SELECT MAX(service_date)
	FROM service AS s
	WHERE s.customer_id = c.customer_id
) AS last_service_date
FROM customer AS c
WHERE email IS NOT NULL;


--QM7: QUERY DATA WITH EXCEPT:
----Description: Identify customers who have not yet made a purchase in order to record more sales

SELECT customer_id
FROM customer
EXCEPT 
	SELECT customer_id
	FROM sale;


--QM8.1: QUERY DATA WITH ANY/SOME:
----Description: Ensure that all recorded sales have an assigned sales associate as opposed to other employees

SELECT employee_id, first_name, last_name, job_title
FROM employee
WHERE employee_id = ANY (
	SELECT employee_id
	FROM sale
);


--QM8.2: QUERY DATA WITH ALL in front of a sub-query:
----Description: Provide a customer estimate for a transmission repair by identifying the service instance with the highest cost for that service type in order to send an accurate customer email

SELECT service_id, service_type, cost
FROM service
WHERE service_type = 'Transmission Repair'
	AND cost >= ALL (
		SELECT cost
		FROM service
		WHERE service_type = 'Transmission Repair'
		AND cost IS NOT NULL
);



