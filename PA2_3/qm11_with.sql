WITH sales_counts AS (
    SELECT employee_id, COUNT(*) AS num_sales
    FROM sale AS s
    GROUP BY employee_id
)
SELECT e.employee_id, e.first_name, e.last_name, e.job_title, sc.num_sales
FROM sales_counts AS sc
JOIN employee AS e ON sc.employee_id = e.employee_id
WHERE sc.num_sales > 15;
