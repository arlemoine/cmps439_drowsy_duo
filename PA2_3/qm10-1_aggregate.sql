SELECT c.customer_id, c.first_name, c.last_name, c.email, SUM(s.cost) AS total_service_cost
FROM customer as c 
JOIN service AS s ON c.customer_id = s.customer_id
WHERE s.cost IS NOT NULL
GROUP BY c.customer_id, c.first_name, c.last_name, c.email
HAVING SUM(s.cost) > 1000;