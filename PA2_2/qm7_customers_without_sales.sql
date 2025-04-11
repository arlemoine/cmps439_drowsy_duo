SELECT customer_id
FROM customer
EXCEPT 
	SELECT customer_id
	FROM sale;
