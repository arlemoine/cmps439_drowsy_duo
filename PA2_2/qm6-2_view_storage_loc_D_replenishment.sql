SELECT d.part_id, d.description, d.qty_current, d.qty_min
FROM (
	SELECT part_id, description, qty_current, qty_min
	FROM part
	WHERE storage_loc = 'D'
) AS d
WHERE d.qty_current <= d.qty_min;
