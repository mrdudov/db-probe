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
