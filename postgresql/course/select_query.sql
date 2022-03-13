SELECT product_id, product_name, unit_price 
FROM products;

SELECT product_id, product_name, unit_price * units_in_stock
FROM products;

SELECT DISTINCT city
FROM employees;

SELECT DISTINCT city, country
FROM employees;

SELECT COUNT(*) 
FROM orders;

SELECT COUNT(DISTINCT country)
FROM employees;
 