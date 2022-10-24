
USE sql_invoicing;

-- Method 1 compare one value  which is max
SELECT *
FROM invoices
WHERE  invoice_total>(
SELECT MAX(invoice_total)
FROM invoices
WHERE client_id=3
);

-- Method 2  compares all  values
SELECT *
FROM invoices
WHERE invoice_total>ALL(
SELECT invoice_total
FROM invoices
WHERE client_id=3
)
