SELECT customer_id, last_name, last_contact
FROM customer;


-- Update last contact date
UPDATE customer
SET last_contact = GETDATE()
WHERE customer_id=1;