SELECT category_id, AVG(unit_price) AS avg_price
FROM products
GROUP BY category_id
LIMIT 5;


SELECT 
    category_id, 
    category_name, 
    product_name, 
    unit_price, 
    AVG(unit_price) OVER (PARTITION BY category_id) AS avg_price
FROM products
JOIN categories USING(category_id);


SELECT 
    order_id, 
    order_date, 
    product_id, 
    customer_id, 
    unit_price AS sub_total,
    SUM(unit_price) OVER(PARTITION BY order_id ORDER BY product_id) AS sale_sum
FROM orders
JOIN order_details USING(order_id)
ORDER BY order_id;


SELECT 
    row_id,
    order_id, 
    order_date, 
    product_id, 
    customer_id, 
    unit_price AS sub_total,
    SUM(unit_price) OVER(ORDER BY row_id) AS sale_sum
FROM (
    SELECT 
        order_id, 
        order_date, 
        product_id, 
        customer_id, 
        unit_price,
        row_number() OVER() AS row_id
    FROM orders
    JOIN order_details USING(order_id)
) subquery 
ORDER BY order_id;

 

SELECT *
FROM products;

SELECT product_name, units_in_stock,
    RANK() OVER(ORDER BY product_id)
FROM products;

SELECT product_name, units_in_stock,
    RANK() OVER(ORDER BY units_in_stock)
FROM products;

SELECT product_name, units_in_stock,
    DENSE_RANK() OVER(ORDER BY units_in_stock)
FROM products;


SELECT product_name, units_in_stock, unit_price, 
    DENSE_RANK() OVER(ORDER BY 
        CASE
            WHEN unit_price >= 80 THEN 1
            WHEN unit_price > 30 AND unit_price < 80 THEN 2
            ELSE 3
        END 
    ) AS ranking
FROM products
ORDER BY unit_price DESC;

SELECT product_name, unit_price,
    LAG(unit_price) OVER(ORDER BY unit_price DESC) - unit_price AS price_lag
FROM products
ORDER BY unit_price DESC;


SELECT product_name, unit_price,
    LEAD(unit_price) OVER(ORDER BY unit_price) - unit_price AS price_lag
FROM products
ORDER BY unit_price;

SELECT product_name, unit_price,
    LEAD(unit_price, 2) OVER(ORDER BY unit_price) - unit_price AS price_lag
FROM products
ORDER BY unit_price;
