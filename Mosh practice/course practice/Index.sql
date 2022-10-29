EXPLAIN SELECT customer_id
FROM customers WHERE state='VA';

CREATE INDEX idx_state on customers(state);

EXPLAIN SELECT customer_id
FROM customers  WHERE points>1000;

CREATE INDEX idx_points on customers(points);

SHOW INDEXES IN customers;

-- Full text index
USE sql_blog;
CREATE FULLTEXT INDEX idx_title_body ON posts(title,body);

SELECT *
FROM posts
WHERE MATCH (title,body) AGAINST ('react -redux +form'IN BOOLEAN MODE); 

-- Composite indexes
USE sql_store;
CREATE INDEX idx_state_points ON customers (state,points);
EXPLAIN SELECT customer_id FROM customers
WHERE state='CA' AND points>1000; 
DROP INDEX idx_points ON  customers;
DROP INDEX idx_state ON  customers;