SELECT s.service_id, p.part_id, p.description
FROM service as s
RIGHT JOIN part as p ON s.part_id = p.part_id
WHERE s.service_id IS NULL;