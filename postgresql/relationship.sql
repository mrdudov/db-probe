DROP TABLE person;
DROP TABLE car;


CREATE TABLE car (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    price NUMERIC(19, 2) NOT NULL
);


CREATE TABLE person (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150),
    gender VARCHAR(7) NOT NULL,
    date_of_birth DATE NOT NULL,
    country_of_birth VARCHAR(50),
    car_id BIGINT REFERENCES car (id),
    UNIQUE(car_id)
);


INSERT INTO person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Abigail', 'Newman', 'melissa23@example.org', 'Male', '1975-05-01', 'Turkmenistan');
INSERT INTO person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Brandon', 'Chan', 'jeffanderson@example.com', 'Male', '2001-10-25', 'Greece');
INSERT INTO person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Christopher', 'Lopez', 'dianaduffy@example.org', 'Male', '1992-03-18', 'Liberia');


INSERT INTO car (make, model, price) values ('Ford', 'B-Class', '30840.13');
INSERT INTO car (make, model, price) values ('Isuzu', 'X1', '10000.06');
