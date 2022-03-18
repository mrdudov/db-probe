-- CREATE FUNCTION

SELECT *
FROM customers:

SELECT *
INTO tmp_customers
FROM customers;

SELECT *
FROM tmp_customers;

UPDATE tmp_customers
SET region = 'unknown'
WHERE region IS NULL;

CREATE OR REPLACE FUNCTION fix_customers_region() RETURNS void AS $$
    UPDATE tmp_customers
    SET region = 'unknown'
    WHERE region IS NULL;
$$ LANGUAGE SQL;

SELECT fix_customers_region();

SELECT *
FROM tmp_customers;

