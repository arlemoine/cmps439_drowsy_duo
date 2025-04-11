SELECT customer_id,first_name, last_name, email,(
	SELECT MAX(service_date)
	FROM service AS s
	WHERE s.customer_id = c.customer_id
) AS last_service_date
FROM customer AS c
WHERE email IS NOT NULL;
