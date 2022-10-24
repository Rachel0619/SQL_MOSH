-- Natural join is easy but kind of dangerous since you let the database 
    -- guess how to link the tables. Therefore we don't encourage this way 

SELECT 
	o.order_id,
    c.first_name
FROM orders o
NATURAL JOIN customers c
