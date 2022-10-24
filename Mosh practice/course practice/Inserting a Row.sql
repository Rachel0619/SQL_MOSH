INSERT INTO customers (
	last_name,
    first_name,
    birth_date,
    address,
    city,
    state) -- other values would be assigned as default value
VALUES(
	'Smith',
    'John',
    '1990-01-01',
    'address',
    'city',
    'CA') -- once executing the clouses, a new row would be inserted 
    
-- Insert Multiple Rows
INSERT INTO shippers(name)
VALUES('shipper1'),
	('shipper2'),
    ('shipper3')
    
INSERT INTO  products(name, quantity_in_stock, unit_price)
VALUES('Product1',10,1.95),
	('Product2',11,2),
    ('Product3',12,2.5)
    
-- Inserting Hiararchical Rows
INSERT INTO orders(customer_id, order_date, status)
VALUES(1,'2019-02-02',1);
INSERT INTO order_items
VALUES
	(LAST_INSERT_ID(), 1, 1, 2.95),
	(LAST_INSERT_ID(), 2, 1, 3.95)
    


