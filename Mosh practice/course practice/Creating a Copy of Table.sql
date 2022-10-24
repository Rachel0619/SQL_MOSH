CREATE TABLE orders_archived AS
SELECT * FROM orders

-- Using this method to create a table, there is no primary key and auto incremental
INSERT INTO orders_archived
SELECT *
FROM orders
WHERE order_date<'2019-01-01'

-- Exercise
USE sql_invoicing;

CREATE TABLE invoices_archived AS 
SELECT 
	i.invoice_id,
    i.number,
    c.name AS client,
    i.invoice_total,
    i.payment_total,
    i.invoice_date,
    i.due_date,
    i.payment_date
FROM invoices i
JOIN clients c
	ON i.client_id=c.client_id
WHERE i.payment_date IS NOT NULL