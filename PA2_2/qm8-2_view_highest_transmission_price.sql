SELECT service_id, service_type, cost
FROM service
WHERE service_type = 'Transmission Repair'
	AND cost >= ALL (
		SELECT cost
		FROM service
		WHERE service_type = 'Transmission Repair'
		AND cost IS NOT NULL
);
