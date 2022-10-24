SELECT
	state,
    city,
    SUM(invoice_total)  AS  total_sales
FROM invoices
JOIN clients c USING (client_id)
GROUP  BY  state,city with rollup;

-- Exercise
SELECT
	pm.name AS  payment_method,
    SUM(amount) AS total
FROM payments p
JOIN payment_methods pm
	on p.payment_method=pm.payment_method_id
GROUP BY pm.name WITH  ROLLUP 
-- column aliens can not be used in group by clause, so we  need to  use pm.name here
