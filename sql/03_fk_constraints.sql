-- Employee Table

ALTER TABLE employee
ADD CONSTRAINT fk_employee_manager
FOREIGN KEY (manager_id) REFERENCES employee(employee_id);

-- Sale Table

ALTER TABLE sale
ADD CONSTRAINT fk_sale_customer
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

ALTER TABLE sale
ADD CONSTRAINT fk_sale_employee
FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

ALTER TABLE sale
ADD CONSTRAINT fk_sale_vehicle
FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id);

-- Service Table

ALTER TABLE service
ADD CONSTRAINT fk_service_vehicle
FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id);

ALTER TABLE service
ADD CONSTRAINT fk_service_customer
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

ALTER TABLE service
ADD CONSTRAINT fk_service_employee
FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

ALTER TABLE service
ADD CONSTRAINT fk_service_part
FOREIGN KEY (part_id) REFERENCES part(part_id);








