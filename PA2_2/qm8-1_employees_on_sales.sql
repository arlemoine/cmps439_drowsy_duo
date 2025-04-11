SELECT employee_id, first_name, last_name, job_title
FROM employee
WHERE employee_id = ANY (
	SELECT employee_id
	FROM sale
);
