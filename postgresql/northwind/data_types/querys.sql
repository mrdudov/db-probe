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
