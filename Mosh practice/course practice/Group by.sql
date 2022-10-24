SELECT 
	client_id,
    SUM(invoice_total)  AS  total_sales
FROM invoices
JOIN clients USING  (client_id)
WHERE invoice_date>='2019-07-01' -- Where is used before group by
GROUP BY  client_id		
ORDER BY total_sales  DESC;

SELECT 
	state,
    city,
    SUM(invoice_total)  AS  total_sales
FROM invoices
JOIN clients USING  (client_id)
GROUP BY  state, city;

-- Exercise
	SELECT 
		p.date,
		pm.name AS payment_method,
		SUM(p.amount) AS total_payments
	FROM payments p
	JOIN payment_methods pm
		ON p.payment_method=pm.payment_method_id
	GROUP BY p.date, payment_method
	ORDER BY  p.date;

SELECT
	client_id,
    SUM(invoice_total) AS total_sales,
    COUNT(*) AS number_of_invoices
FROM invoices
GROUP BY client_id
HAVING total_sales>500 AND number_of_invoices>5;
--  Having is used  after group by

-- Exercise

SELECT 
	c.customer_id,
    c.first_name,
    c.last_name,
    SUM(oi.quantity*oi.unit_price) AS total_sales
FROM  customers c
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id)
WHERE state='VA'
GROUP BY 
	c.customer_id,
    c.first_name,
    c.last_name
HAVING total_sales>100


