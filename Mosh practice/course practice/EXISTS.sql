-- Select clients that have an invoice

-- Method 1: produces large result set when there are numerous  data
SELECT *
FROM invoices
WHERE  client_id IN (
	SELECT DISTINCT client_id
    FROM invoices
);

-- Method 2:more  efficient because it doesn't return the result  set to the outer  query
SELECT *
FROM clients c
WHERE  EXISTS (
	SELECT client_id
    FROM invoices
    WHERE client_id=c.client_id
);

-- Exercise
-- Find the products  that have never been ordered

USE  sql_store;

SELECT *
FROM  products p
WHERE NOT EXISTS (
	SELECT product_id
    FROM order_items o
    WHERE p.product_id=o.product_id
)


