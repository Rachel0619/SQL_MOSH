SELECT
	c.first_name AS customer,
    p.name AS product
FROM customers c
CROSS JOIN products p  -- explicit clause
ORDER BY c.first_name

-- Exercise
SELECT 
	p.product_id,
    p.name AS product,
    s.name AS shipper
FROM products p, shippers s   -- implicit cross join
-- CROSS JOIN shippers s   -- explicit cross join



