-- self outer joins:handle the problem of missing the CEO who doesn't have a manager
USE sql_hr;

SELECT 
	e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e
LEFT JOIN employees m
	ON e.reports_to=m.employee_id