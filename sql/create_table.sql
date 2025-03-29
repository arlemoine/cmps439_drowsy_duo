CREATE TABLE customer (
	customer_id INT,
    first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	phone CHAR(10),
	address VARCHAR(100),
	city VARCHAR(50),
	state CHAR(2),
	license_num CHAR(9),
	last_contact DATE CHECK (last_contact <= GETDATE()),
	PRIMARY KEY (customer_id)
)