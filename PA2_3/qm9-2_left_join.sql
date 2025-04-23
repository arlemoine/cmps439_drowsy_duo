SELECT c.customer_id, c.first_name, c.last_name, s.service_id
FROM customer AS c
LEFT JOIN service AS s ON c.customer_id = s.customer_id
WHERE s.service_id IS NULL;