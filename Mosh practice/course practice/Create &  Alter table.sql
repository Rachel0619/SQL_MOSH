CREATE DATABASE IF NOT EXISTS sql_store2;
USE sql_store2;
DROP TABLE IF EXISTS orders; -- we need  to delete the prder table first 
-- before we delete the customer table, since we have a relationship between two tables
DROP TABLE IF EXISTS customers;
CREATE TABLE  customers
(
	customer_id INT  PRIMARY KEY auto_increment,
    first_name VARCHAR(50) NOT NULL,
    points INT NOT NULL default 0,
    email varchar(255) NOT NULL UNIQUE
);
CREATE  TABLE orders
(
	order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    FOREIGN KEY fk_orders_customers(customer_id)
		REFERENCES customerS(customer_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION 
);

ALTER TABLE customers
	ADD last_name VARCHAR(50) NOT NULL AFTER first_name, 
    ADD city VARCHAR(50) NOT NULL,
    MODIFY COLUMN first_name VARCHAR(55) DEFAULT ' ',
	DROP points;

ALTER TABLE orders
	ADD PRIMARY KEY (order_id),
    DROP PRIMARY KEY,
	DROP FOREIGN KEY fk_orders_customers,
    ADD FOREIGN KEY  fk_orders_customers(customer_id)
		REFERENCES  customers(customer_id)
        ON UPDATE CASCADE
        ON DELETE  NO ACTION;


