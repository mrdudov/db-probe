-- 1. Выбрать все данные из таблицы customers

SELECT *
FROM customers;

-- 2. Выбрать все записи из таблицы customers, но только колонки "имя контакта" и "город"

SELECT contact_name, city
FROM customers;

-- 3. Выбрать все записи из таблицы orders, но взять две колонки: идентификатор заказа и колонку, значение в которой
--      мы рассчитываем как разницу между датой отгрузки и датой формирования заказа.

SELECT order_id, shipped_date - order_date
FROM orders;

-- 4. Выбрать все уникальные города в которых "зарегестрированы" заказчики

SELECT DISTINCT city
FROM customers;

-- 5. Выбрать все уникальные сочетания городов и стран в которых "зарегестрированы" заказчики

SELECT DISTINCT city, country
FROM customers;

-- 6. Посчитать кол-во заказчиков

SELECT COUNT(*)
FROM customers;

-- 7. Посчитать кол-во уникальных стран в которых "зарегестрированы" заказчики

SELECT COUNT(DISTINCT country)
FROM customers;

-- 8. Выбрать все заказы из стран France, Austria, Spain

SELECT *
FROM orders
WHERE ship_country IN ('France', 'Austria', 'Spain');

-- 9. Выбрать все заказы, отсортировать по required_date (по убыванию) и отсортировать по дате отгрузке (по возрастанию)

SELECT * 
FROM orders
ORDER BY required_date DESC, shipped_date ASC;

-- 10. Выбрать минимальное кол-во  единиц товара среди тех продуктов, которых в продаже более 30 единиц.

SELECT MIN(units_in_stock) 
FROM products
WHERE units_in_stock > 30;

-- 11. Выбрать максимальное кол-во единиц товара среди тех продуктов, которых в продаже более 30 единиц.


SELECT MAX(units_in_stock) 
FROM products
WHERE units_in_stock > 30;

-- 12. Найти среднее значение дней уходящих на доставку с даты формирования заказа в USA

SELECT AVG(shipped_date - order_date)
FROM orders
WHERE ship_country = 'USA';


-- 13. Найти сумму, на которую имеется товаров (кол-во * цену) причём таких, 
--      которые планируется продавать и в будущем (см. на поле discontinued)

SELECT SUM(units_in_stock * unit_price)
FROM products
WHERE discontinued != 0;
