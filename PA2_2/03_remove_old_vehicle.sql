SELECT vehicle_id, date_arrive, mileage
FROM vehicle;

-- Delete vehicles that have been in stock for over 365 days and haven't sold
DELETE 
FROM vehicle
WHERE vehicle_id = 17;
