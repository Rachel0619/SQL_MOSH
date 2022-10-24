
SELECT *
FROM products
WHERE unit_price>(
	SELECT unit_price
    FROM  products
    WHERE product_id=3
);

-- Exercise
SELECT *
FROM employees
WHERE salary>(
	SELECT avg(salary)
    FROM employees
);

-- The In operator
SELECT *
FROM products
WHERE product_id  NOT IN 
	(SELECT distinct product_id
	FROM order_items);
    
-- Exercise
SELECT *
FROM clients
WHERE client_id NOT IN
	(SELECT distinct client_id
	FROM  invoices);

-- Exercises using sub query
SELECT 
	customer_id, 
    first_name,
    last_name
FROM customers
WHERE customer_id IN
(SELECT distinct customer_id
FROM orders
WHERE order_id IN
(SELECT  order_id
FROM order_items
WHERE product_id=3));

--  Using join
SELECT 
	distinct customer_id,
    first_name,
    last_name
FROM customers
JOIN  orders
USING (customer_id)
JOIN order_items
USING (order_id)
WHERE product_id=3;

