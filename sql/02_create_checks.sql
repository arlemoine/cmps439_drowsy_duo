-- Customer Table

ALTER TABLE customer
ADD CONSTRAINT chk_customer_last_contact_date_past
CHECK (last_contact <= GETDATE());

-- Employee Table

ALTER TABLE employee
ADD CONSTRAINT chk_employee_hire_date_past
CHECK (hire_date <= GETDATE());

ALTER TABLE employee
ADD CONSTRAINT chk_employee_pos_salary
CHECK (salary >= 0);

-- Part Table

ALTER TABLE part
ADD CONSTRAINT chk_part_unit_cost_pos
CHECK (unit_cost >= 0);

ALTER TABLE part
ADD CONSTRAINT chk_part_selling_price_pos
CHECK (selling_price >= 0);

ALTER TABLE part
ADD CONSTRAINT chk_part_qty_current_pos
CHECK (qty_current >= 0);

ALTER TABLE part
ADD CONSTRAINT chk_part_qty_min_pos
CHECK (qty_min >= 0);

ALTER TABLE part
ADD CONSTRAINT chk_part_qty_max_pos
CHECK (qty_max >= 0);

-- Sale Table

ALTER TABLE sale 
ADD CONSTRAINT chk_sale_date_past
CHECK (sale_date <= GETDATE());

ALTER TABLE sale
ADD CONSTRAINT chk_sale_car_package
CHECK (car_package IN ('Basic', 'Standard', 'Premium'));

ALTER TABLE sale
ADD CONSTRAINT chk_sale_financing_type
CHECK (financing_type IN ('Loan', 'Lease', 'Cash'));

ALTER TABLE sale
ADD CONSTRAINT chk_sale_price_pos
CHECK (sale_price >= 0);

-- Service Table

ALTER TABLE service 
ADD CONSTRAINT chk_service_date_past
CHECK (service_date <= GETDATE());

ALTER TABLE service
ADD CONSTRAINT chk_service_mileage_current_pos
CHECK (mileage_current  >= 0);

ALTER TABLE service
ADD CONSTRAINT chk_service_mileage_next_pos
CHECK (mileage_next  >= 0);

ALTER TABLE service
ADD CONSTRAINT chk_service_mileage_next_greater_current
CHECK (mileage_next  >= mileage_current);

ALTER TABLE service
ADD CONSTRAINT chk_service_cost
CHECK (cost >= 0);

-- Vehicle Table

ALTER TABLE vehicle
ADD CONSTRAINT chk_vehicle_model_year_valid
CHECK (v_year <= YEAR(GETDATE()) + 1);

ALTER TABLE vehicle 
ADD CONSTRAINT chk_vehicle_date_arrive_past
CHECK (date_arrive <= GETDATE());

ALTER TABLE vehicle 
ADD CONSTRAINT chk_vehicle_date_depart_past
CHECK (date_depart <= GETDATE());

ALTER TABLE vehicle
ADD CONSTRAINT chk_vehicle_mileage_pos
CHECK (mileage >= 0);

ALTER TABLE vehicle
ADD CONSTRAINT chk_vehicle_owners_pos
CHECK (num_owners >= 0);

ALTER TABLE vehicle
ADD CONSTRAINT chk_vehicle_price_pos
CHECK (list_price >= 0);






