SELECT 
	o.order_id,
    c.first_name,
    sh.name AS shipper
FROM orders o
JOIN customers c
	-- ON o.customer_id=c.customer_id (this is an optional clause)
    USING (customer_id) -- Using keyword only works when the column names are same
						    -- between two tables
LEFT JOIN shippers sh
	USING (shipper_id) 

SELECT *
FROM order_items oi
JOIN order_item_notes oin
	USING (order_id,product_id)
    
-- Exercises
Using sql_invoicing;

SELECT 
	p.date,
    c.name AS client,
    p.amount,
    pm.name as 'payment method'
FROM payments p
JOIN clients c
	USING (client_id)
JOIN payment_methods pm
	ON p.payment_method=pm.payment_method_id

