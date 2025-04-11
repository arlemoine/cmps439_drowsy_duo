SELECT customer_id, first_name, last_name, email
FROM customer
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM sale
);
