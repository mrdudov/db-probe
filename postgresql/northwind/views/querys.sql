CREATE VIEW products_suppliers_categoris AS 
SELECT 
    product_name, quantity_per_unit, unit_price, units_in_stock,
    company_name, contact_name, phone, category_name, description
FROM products
JOIN suppliers USING(supplier_id)
JOIN categories USING(category_id);


SELECT *
FROM products_suppliers_categoris
WHERE unit_price > 20;

DROP VIEW IF EXISTS products_suppliers_categoris;

CREATE VIEW heavy_orders AS
SELECT * 
FROM orders
WHERE freight > 50;


SELECT *
FROM heavy_orders
ORDER BY freight;

CREATE OR REPLACE VIEW heavy_orders AS
SELECT * 
FROM orders
WHERE freight > 100;


SELECT *
FROM heavy_orders
ORDER BY freight;

ALTER VIEW products_suppliers_categoris RENAME TO psc_old;


INSERT INTO heavy_orders
VALUES
(11078, 'VINET', 5, '2019-10-10', '2019-11-11', '2020-10-11', 1, 120, 'test', 'test 2', 'test 3', null, 3012, 'sdfwef');

SELECT MIN(freight)
FROM orders;

DELETE FROM heavy_orders
WHERE freight < 0.05;

SELECT MIN(freight)
FROM heavy_orders;

DELETE FROM heavy_orders
WHERE freight < 100.25;
