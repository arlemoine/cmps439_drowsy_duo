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
--QM9.1: INNER-JOIN-QUERY WITH WHERE CLAUSE:
----Description: Identify customers who had their vehicles serviced in the last 6 months to support post-service engagement or promotions.

SELECT c.customer_id, c.email, s.service_id, s.service_date, s.service_type
FROM customer AS c
INNER JOIN service AS s ON c.customer_id = s.customer_id
WHERE s.service_date >= DATEADD(month, -6, GETDATE());


--QM9.2: LEFT-OUTER-JOIN-QUERY WITH WHERE CLAUSE:
----Instruction: The query must return NULL DUE TO MISMATCHING TUPLES during the outer join:
----Description: Identify customers who have never had a vehicle serviced, to support outreach campaigns or loyalty programs.

SELECT c.customer_id, c.first_name, c.last_name, s.service_id
FROM customer AS c
LEFT JOIN service AS s ON c.customer_id = s.customer_id
WHERE s.service_id IS NULL;


--QM9.3: RIGHT-OUTER-JOIN-QUERY WITH WHERE CLAUSE:
----Instruction: The query must return NULL DUE TO MISMATCHING TUPLES during the outer join:
----Description: Identify parts which may never need to be ordered due to not being used in a service.

SELECT s.service_id, p.part_id, p.description
FROM service as s
RIGHT JOIN part as p ON s.part_id = p.part_id
WHERE s.service_id IS NULL;


--QM9.4: FULL-OUTER-JOIN-QUERY WITH WHERE CLAUSE:
----Instruction: The query must return NULL DUE TO MISMATCHING TUPLES from LEFT and RIGHT tables due to the outer join:
----Description: Identify both parts not associated with service item history as well as service items which did not involve stocked parts in order to analyze the need for further part orders.

SELECT s.service_id, p.part_id, p.description
FROM service AS s
FULL OUTER JOIN part AS p ON s.part_id = p.part_id
WHERE s.service_id IS NULL OR p.part_id IS NULL;


--QM10.1: AGGREGATION-JOIN-QUERY WITH GROUP BY & HAVING:
----Description: Identify customers who have spent over $1,000.00 total on vehicle services to recognize high-value clients for possible loyalty reward and premium outreach.

SELECT c.customer_id, c.first_name, c.last_name, c.email, SUM(s.cost) AS total_service_cost
FROM customer as c 
JOIN service AS s ON c.customer_id = s.customer_id
WHERE s.cost IS NOT NULL
GROUP BY c.customer_id, c.first_name, c.last_name, c.email
HAVING SUM(s.cost) > 1000;


--QM10.2: AGGREGATION-JOIN-QUERY WITH SUB-QUERY:
----Description: Identify services that cost less than the average so they can be advertised in reminder emails.

SELECT s.service_type, AVG(s.cost) AS avg_cost
FROM service AS s
JOIN customer AS c ON s.customer_id = c.customer_id
WHERE s.cost IS NOT NULL
GROUP BY s.service_type
HAVING AVG(s.cost) < (
	SELECT AVG(cost)
	FROM service
	WHERE cost IS NOT NULL
);


--QM11: WITH-QUERY:
----Description: Identify sales associates with high number of sales for special recognition to drive further sales.

WITH sales_counts AS (
    SELECT employee_id, COUNT(*) AS num_sales
    FROM sale AS s
    GROUP BY employee_id
)
SELECT e.employee_id, e.first_name, e.last_name, e.job_title, sc.num_sales
FROM sales_counts AS sc
JOIN employee AS e ON sc.employee_id = e.employee_id
WHERE sc.num_sales > 15;

