DROP PROCEDURE IF EXISTS get_clients_by_state;

-- Approach 1: use if
DELIMITER $$
CREATE PROCEDURE get_clients_by_state(state CHAR(2))
-- parameter is  necessary  otherwise therewould be sytax  error
BEGIN
	IF state IS NULL THEN
		SELECT * FROM clients;
	ELSE
    	SELECT *  FROM clients c
		WHERE c.state=state;
    END IF;
END $$

DELIMITER ；

-- Approach 2: use IFNULL

DELIMITER $$
CREATE PROCEDURE get_clients_by_state(state CHAR(2))
-- parameter is  necessary  otherwise therewould be sytax  error
BEGIN
    	SELECT *  FROM clients c
		WHERE c.state=IFNULL(state, c.state);
END $$
DELIMITER ；

CALL get_clients_by_state('CA')
CALL get_clients_by_state(NULL)

-- Exercise

DELIMITER  $$
CREATE PROCEDURE get_invoices_by_client(client_id INT)
BEGIN
	SELECT * FROM invoices i
    WHERE i.client_id=client_id;
END  $$
DELIMITER ;

CALL get_invoices_by_client(3);

-- Exercise
-- Write a stored procedure called get_payments
-- with two peremeters
-- client_id which is INT (4 bytes)
-- payment_method_id which is TINYINT (1 bytes which can store 0-255)

DELIMITER $$
CREATE PROCEDURE get_payments(client_id INT, payment_method TINYINT)
BEGIN
	SELECT *  
    FROM payments p
    WHERE p.client_id=IFNULL(client_id, p.client_id)
    AND p.payment_method=IFNULL(payment_method, p.payment_method);
END $$
DELIMITER ;
    
CALL get_payments(5,NULL)
