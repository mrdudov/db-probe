CREATE DATABASE test;

DROP DATABASE db_name;


CREATE TABLE person (
    id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(7),
    date_of_birth DATE
);

DROP TABLE person;

CREATE TABLE person (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150),
    gender VARCHAR(7) NOT NULL,
    date_of_birth DATE NOT NULL,
    country_of_birth VARCHAR(50)
);

INSERT INTO person (
    first_name,
    last_name,
    gender,
    date_of_birth
)
VALUES ('Anne', 'Smith', 'FEMALE', date '1988-01-09');

INSERT INTO person (
    first_name,
    last_name,
    gender,
    date_of_birth,
    email
)
VALUES ('Jake', 'Jonse', 'MALE', date '1990-12-31', 'jake@gmail.com');

SELECT * from person;

SELECT first_name, last_name FROM person;

-- 123 - ASC
-- 321 - DESC

SELECT * FROM person ORDER BY first_name DESC, country_of_birth ASC;

SELECT DISTINCT country_of_birth FROM person ORDER BY country_of_birth;

SELECT * 
FROM person 
WHERE 
    gender = 'Female' 
    AND 
        (country_of_birth = 'Poland' OR country_of_birth = 'China')
    AND
        last_name = 'Kim';

SELECT 1 = 1;
SELECT 1 <> 2; -- not equal

SELECT * FROM person LIMIT 10;

SELECT * FROM person OFFSET 10 LIMIT 10;

SELECT * FROM person OFFSET 5 FETCH FIRST 10 ROW ONLY;

SELECT *
FROM person
WHERE country_of_birth IN ('China', 'Brazil', 'France');


SELECT *
FROM person
WHERE date_of_birth BETWEEN DATE '2000-01-01' AND '2015-01-01';

SELECT * FROM person WHERE email LIKE '%.com';

SELECT * FROM person WHERE email LIKE '_____@%';

SELECT * FROM person WHERE country_of_birth ILIKE 'p%';

SELECT country_of_birth, COUNT(*) FROM person GROUP BY country_of_birth;

SELECT country_of_birth, COUNT(*) 
FROM person 
GROUP BY country_of_birth 
HAVING COUNT(*) > 5
ORDER BY country_of_birth;
