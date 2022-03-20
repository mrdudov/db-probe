CREATE DOMAIN text_no_space_null AS text NOT NULL CHECK (value ~ '^(?!\s*$).+');

CREATE TABLE agent 
(
    first_name text_no_space_null,
    last_name text_no_space_null
);

INSERT INTO agent
VALUES ('bob', 'taylor');

SELECT * FROM agent;

INSERT INTO agent
VALUES ('', 'taylor');

INSERT INTO agent
VALUES (NULL, 'taylor');

INSERT INTO agent
VALUES ('   ', 'taylor');

INSERT INTO agent
VALUES ('bob junior', 'taylor');

SELECT * FROM agent;

ALTER DOMAIN text_no_space_null
ADD CONSTRAINT text_no_space_null_length32 CHECK (length(value)<=32) NOT VALID;

ALTER DOMAIN text_no_space_null
VALIDATE CONSTRAINT text_no_space_null_length32;

DROP TABLE IF EXISTS agent;
DROP DOMAIN IF EXISTS text_no_space_null;

-- Composite Types

DROP FUNCTION IF EXISTS get_price_boundaries;

CREATE OR REPLACE FUNCTION get_price_boundaries(OUT max_price real, OUT min_price real) AS $$
    SELECT MAX(unit_price), MIN(unit_price)
    FROM products
$$ LANGUAGE SQL;

SELECT * FROM get_price_boundaries();

CREATE TYPE price_bounds AS 
(
    max_price real,
    min_price real
);

DROP FUNCTION IF EXISTS get_price_boundaries;

CREATE OR REPLACE FUNCTION get_price_boundaries() RETURNS SETOF price_bounds AS $$
    SELECT MAX(unit_price), MIN(unit_price)
    FROM products
$$ LANGUAGE SQL;

SELECT * FROM get_price_boundaries();

CREATE TYPE complex AS 
(
    r float8,
    i float8
);

CREATE TABLE math_calcs
(
    math_id serial,
    val complex
);


INSERT INTO math_calcs (val)
VALUES 
(ROW(3.0, 4.0)),
(ROW(2.0, 1.0));

SELECT * FROM math_calcs;

SELECT (val).r FROM math_calcs;

SELECT (math_calcs.val).r FROM math_calcs;

SELECT (val).* FROM math_calcs;

UPDATE math_calcs
SET val = ROW(5.0, 4.0)
WHERE math_id = 1;

SELECT * FROM math_calcs;

UPDATE math_calcs
SET val.r= 7.9
WHERE math_id = 1;

SELECT * FROM math_calcs;

UPDATE math_calcs
SET val.r = val.r + 0.9
WHERE math_id = 1;

SELECT * FROM math_calcs;
