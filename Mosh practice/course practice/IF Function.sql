SELECT
	order_id,
    order_date,
    IF(YEAR(order_date)=YEAR(NOW())-3,'Active','Archived') AS status
FROM orders;

-- Exercise


SELECT
	product_id,
    name,
    order_times,
    if(order_times>1,'Many times','Once') AS frequency
-- Every derived table must have its own alias!!!!
FROM products
JOIN
    (SELECT 
		product_id,
        count(*) as order_times
    FROM order_items 
    GROUP  BY  product_id) AS intermediate -- 
USING (product_id)
    
    