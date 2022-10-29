SELECT *  FROM mysql.user;

-- 1:web/desktop application
CREATE USER moon_app IDENTIFIED  BY '1234';
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE
ON sql_store.*
TO  moon_app;

-- 2:admin
CREATE  USER John IDENTIFIED BY '1234';
GRANT ALL
ON *.*
TO John;

SHOW GRANTS FOR  John;

GRANT CREATE VIEW 
ON sql_store.*
TO moon_app;

REVOKE  CREATE  VIEW 
ON sql_store.*
FROM moon_app;
