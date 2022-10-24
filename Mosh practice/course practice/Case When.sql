SELECT
	order_date,
    CASE
		WHEN  YEAR(order_date)=YEAR(NOW())-3 THEN  'Active'
        WHEN  YEAR(order_date)=YEAR(NOW())-4 THEN 'Last Year'
        WHEN YEAR(order_date)<YEAR(NOW())-5 THEN 'Archived'
        ELSE 'Future'
	END AS category
FROM orders;

-- Exercise

SELECT
	CONCAT(first_name,last_name) AS customer,
    points,
    CASE
		WHEN points>3000 THEN 'Gold'
        WHEN points>=2000 THEN 'Silver'
        ELSE 'Bronze'
	END AS category
FROM customers