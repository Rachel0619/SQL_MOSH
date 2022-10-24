SELECT LOCATE('n','kingergarten')
-- if we search for the character that doesn't exist in the string,
-- the function would return 0
SELECT LOCATE('garten','kingergarten');
-- return the position first character appears
SELECT REPLACE('kindergarten','garten','garden')
SELECT CONCAT('first','last')

SELECT CONCAT(first_name,' ',last_name) AS full_name
FROM customers