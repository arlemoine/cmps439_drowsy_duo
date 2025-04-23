SELECT c.customer_id, c.email, s.service_id, s.service_date, s.service_type
FROM customer AS c
INNER JOIN service AS s ON c.customer_id = s.customer_id
WHERE s.service_date >= DATEADD(month, -6, GETDATE());