USE sql_invoicing;

SELECT
	invoice_id,
    invoice_total,
    (SELECT AVG (invoice_total)
    FROM invoices) AS invoice_average,
    invoice_total-(SELECT invoice_average) AS difference
--  we can't use invoice_average directly. 'SELECT' is needed here   
FROM invoices;

-- Exercise
-- Note:you can use sub query  in from  clause,  but reserve it only for simple queries
-- Problem:how  to  use group by in this case???
USE  sql_invoicing;

SELECT *
FROM(
	SELECT
		DISTINCT client_id,
		name,
		(SELECT  AVG(invoice_total)
		FROM invoices) AS invoice_average,
		(SELECT  SUM(invoice_total)
		FROM invoices
		WHERE client_id=c.client_id) AS total_sales,
		(SELECT total_sales-invoice_average) AS difference
	FROM clients c
) AS sales_summary -- Alien name is  necessary otherwise there would be sytax error
WHERE total_sales IS  NOT NULL
    