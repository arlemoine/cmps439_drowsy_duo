SELECT * FROM vehicle;

SELECT vehicle_id, v_model, v_year, mileage, list_price
FROM vehicle
WHERE (v_year > 2023) OR 
      ( (mileage < 20000) AND
        (list_price < 15000) 
      );
