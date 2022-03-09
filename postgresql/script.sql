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
    gender VARCHAR(7) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(150)
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
VALUES ('Jake', 'Jonse', 'MALE', date '1990-12-31', 'jake#gmail.com');
