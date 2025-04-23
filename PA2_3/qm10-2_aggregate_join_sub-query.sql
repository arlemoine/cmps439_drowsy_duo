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
