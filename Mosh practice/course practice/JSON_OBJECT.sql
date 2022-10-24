USE sql_store;
UPDATE products
SET properties='
{
	"dimensions":[1,2,3],
    "weight":10,
    "manufacturer":{"name":"sony"}
}
'
WHERE product_id=1; 	

UPDATE products
SET properties=JSON_OBJECT(
'weight',10,
'dimensions',JSON_ARRAY(1,2,3),
'manufacturer',JSON_OBJECT('name','sony')
)
WHERE product_id=1;

SELECT product_id,JSON_EXTRACT(properties, '$.weight') AS weight
FROM  products
WHERE product_id=1;

SELECT product_id, properties ->'$.dimensions[0]' AS dimension
FROM  products
WHERE product_id=1;

SELECT product_id, properties ->>'$.manufacturer.name' AS manufacturer
FROM  products
WHERE product_id=1;

SELECT product_id, properties ->>'$.manufacturer.name' AS manufacturer
FROM  products
WHERE properties ->>'$.manufacturer.name'='sony';

-- Update or add new property 
UPDATE products
SET properties=JSON_SET(
	properties,
    '$.wweight',20,
    '$.age',10
)
WHERE product_id=1;

-- Remove a property
UPDATE products
SET properties=JSON_REMOVE(
	properties,
    '$.age'
)
WHERE product_id=1;
