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
----Description: .....................

SELECT ....
FROM ...
WHERE ..... (SELECT .... FROM ..... WHERE .....)

--QM6.2: QUERY DATA WITH SUB-QUERY IN FROM CLAUSE:
----Description: .....................

SELECT ....
FROM (SELECT .... FROM ..... WHERE ......) AS <TABLE-NAME> ....
WHERE ...... <TABLE-NAME> ......



--QM6.3: QUERY DATA WITH 'SUB-QUERY IN SELECT CLAUSE':
----Description: .....................

SELECT .... (SELECT .... FROM ... TBI ... WHERE .... TBO.** = TBI.** ... )
FROM ...TBO ...
WHERE ......


--QM7: QUERY DATA WITH EXCEPT:
----Description: .....................


--QM8.1: QUERY DATA WITH ANY/SOME:
----Description: .....................


--QM8.2: QUERY DATA WITH ALL in front of a sub-query:
----Description: .....................


