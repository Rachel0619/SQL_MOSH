-- Functions
-- the difference between  function and procedure is  that 
-- function can  only  return one single  outcome
-- where procedure is able to return multiple rows  and columns

SELECT 
	client_id,
    name,
    get_risk_factor_for_client(client_id) AS risk_factor
FROM clients
