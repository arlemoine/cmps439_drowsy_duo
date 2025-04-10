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
	last_contact DATE,
	PRIMARY KEY (customer_id)
)

CREATE TABLE employee (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone CHAR(10),
    job_title VARCHAR(100),
    hire_date DATE,
    salary NUMERIC(10, 2),
    manager_id INT,
    PRIMARY KEY (employee_id)
);

CREATE TABLE part (
    part_id INT,
    sn VARCHAR(50),
    description VARCHAR(200),
    unit_cost NUMERIC(10,2),
    selling_price NUMERIC(10,2),
    qty_current INT,
    qty_min INT,
    qty_max INT,
    storage_loc VARCHAR(50),
    PRIMARY KEY (part_id)
);

CREATE TABLE sale (
    sale_id INT,
    sale_date DATE,
    customer_id INT,
    employee_id INT,
    vehicle_id INT,
    car_package VARCHAR(100),
    financing_type VARCHAR(100),
    sale_price NUMERIC(10,2),
    profit NUMERIC(10,2),
    PRIMARY KEY (sale_id)
);

CREATE TABLE service (
    service_id INT,
    vehicle_id INT,
    customer_id INT,
    employee_id INT,
    service_date DATE,
    service_type VARCHAR(100),
    part_id VARCHAR(100),
    mileage_current INT,
    mileage_next INT,
    cost NUMERIC(10,2),
    PRIMARY KEY (service_id)
);

CREATE TABLE vehicle (
    vehicle_id INT,
    v_make VARCHAR(100),
    v_model VARCHAR(100),
    v_year INT,
    vin VARCHAR(50),
    date_arrive DATE,
    date_depart DATE,
    mileage INT,
    num_owners INT,
    list_price NUMERIC(10,2),
    PRIMARY KEY (vehicle_id)
);
