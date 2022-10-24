UPDATE invoices
SET 
	payment_total=invoice_total*0.5,
	payment_date=due_date
WHERE client_id = 2

-- Exercise

UPDATE customers
SET 
	points=points+50
WHERE birth_date<'1990-01-01'


--  Using Subqueries in Updates
UPDATE invoices
SET 
	payment_total=invoice_total*0.5,
	payment_date=due_date
WHERE client_id=
	(SELECT client_id
    FROM clients
    WHERE name='Vinte')
    

UPDATE invoices
SET 
	payment_total=invoice_total * 0.5,
	payment_date=due_date
WHERE client_id IN 
			(SELECT client_id
			FROM clients
			WHERE state IN ('CA','NY'))
            
-- Exercise
UPDATE orders
SET 
	comments='golden'
WHERE customer_id IN 
			(SELECT customer_id
			FROM customers
			WHERE points>3000)
            
DELETE FROM invoices
WHERE client_id=(
		SELECT client_id
		FROM clients
		WHERE name='Myworks'
)

