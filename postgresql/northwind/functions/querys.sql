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

-- scalar functions 

CREATE OR REPLACE FUNCTION get_total_number_of_goods() RETURNS bigint AS $$
    SELECT SUM(units_in_stock)
    FROM products;
$$ LANGUAGE SQL;

SELECT get_total_number_of_goods();

CREATE OR REPLACE FUNCTION get_avg_price() RETURNS real AS $$
    SELECT avg(unit_price)
    FROM products;
$$ LANGUAGE SQL;

SELECT get_avg_price() AS avg_price;
