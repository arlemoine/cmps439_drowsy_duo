SELECT s.service_id, p.part_id, p.description
FROM service AS s
FULL OUTER JOIN part AS p ON s.part_id = p.part_id
WHERE s.service_id IS NULL OR p.part_id IS NULL;
