CREATE TABLE customer (
    customer_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone CHAR(10) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state CHAR(2) NOT NULL,
    license_num CHAR(9) NOT NULL,
    last_contact DATE NOT NULL
    	DEFAULT CAST(GETDATE() AS DATE),
    PRIMARY KEY (customer_id)
);

CREATE TABLE employee (
    employee_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone CHAR(10) NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    salary NUMERIC(10, 2) NOT NULL,
    manager_id INT,
    PRIMARY KEY (employee_id)
);

CREATE TABLE part (
    part_id INT NOT NULL,
    sn VARCHAR(50) NOT NULL,
    description VARCHAR(200) NOT NULL,
    unit_cost NUMERIC(10,2) NOT NULL,
    selling_price NUMERIC(10,2) NOT NULL,
    qty_current INT NOT NULL,
    qty_min INT NOT NULL,
    qty_max INT NOT NULL,
    storage_loc VARCHAR(50) NOT NULL,
    PRIMARY KEY (part_id)
);

CREATE TABLE sale (
    sale_id INT NOT NULL,
    sale_date DATE NOT NULL,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    car_package VARCHAR(100) NOT NULL,
    financing_type VARCHAR(100) NOT NULL,
    sale_price NUMERIC(10,2) NOT NULL,
    profit NUMERIC(10,2),
    PRIMARY KEY (sale_id)
);

CREATE TABLE service (
    service_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    service_date DATE NOT NULL,
    service_type VARCHAR(100) NOT NULL,
    part_id INT,
    mileage_current INT NOT NULL,
    mileage_next INT NOT NULL,
    cost NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (service_id)
);

CREATE TABLE vehicle (
    vehicle_id INT NOT NULL,
    v_make VARCHAR(100) NOT NULL,
    v_model VARCHAR(100) NOT NULL,
    v_year INT NOT NULL,
    vin VARCHAR(50) NOT NULL,
    date_arrive DATE NOT NULL,
    date_depart DATE,
    mileage INT NOT NULL,
    num_owners INT NOT NULL,
    list_price NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (vehicle_id)
);
