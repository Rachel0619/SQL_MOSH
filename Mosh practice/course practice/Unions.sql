SELECT 
	order_id,
    order_date,
    'Active' AS status
FROM orders
WHERE order_date>='2019-01-01'
UNION
SELECT 
	order_id,
    order_date,
    'Archived' AS status
FROM orders
WHERE order_date<'2019-01-01'

-- Exercise
SELECT
	customer_id,
    first_name,
    points,
    'Bronze' AS type
From customers
WHERE points<2000
UNION
SELECT
	customer_id,
    first_name,
    points,
    'Silver' AS type
From customers
WHERE 2000<points<3000
UNION
SELECT
	customer_id,
    first_name,
    points,
    'gold' AS type
From customers
WHERE points>3000
ORDER BY first_name