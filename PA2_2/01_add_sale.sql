-- Find the next sale_id
SELECT MAX(sale_id) + 1 AS next_sale_id FROM sale; -- May be inaccurate if records are deleted

-- Search for a sales associate to assign to the sale
SELECT *
FROM employee
WHERE job_title='Sales Associate';

-- Search for vehicles currently in stock
SELECT * 
FROM vehicle
WHERE date_depart IS NULL;

INSERT INTO sale (
    sale_id,
--    sale_date, -- Not needed if date is today due to defaulting rule
    customer_id,
    employee_id,
    vehicle_id,
    car_package,
    financing_type,
    sale_price,
    profit
)
VALUES (
    151, -- sale_id
--    'YYYY-MM-DD',	-- sale_date
    151, -- customer_id
    13, -- employee_id
    6, -- vehicle_id
    'Premium', -- car_package, OPTIONS: Basic, Standard, Premium
    'Loan', -- financing_type, OPTIONS: Loan, Lease, Cash
    25000.00, -- sale_price
    4500.00 -- profit
);

-- View recently added sale
SELECT sale_id, sale_date, vehicle_id, sale_price
FROM sale;
