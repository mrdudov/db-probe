import random

from faker import Faker


fake = Faker()
count = 1000
result = []
sql_file_name = 'person.sql'

db_create_scrypt = """
CREATE TABLE person (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150),
    gender VARCHAR(7) NOT NULL,
    date_of_birth DATE NOT NULL,
    country_of_birth VARCHAR(50)
);
"""

preffix = 'INSERT INTO person (first_name, last_name, email, gender, date_of_birth, country_of_birth) '

for _ in range(count):
    first_name = fake.first_name().replace("'", "''")
    last_name = fake.last_name().replace("'", "''")
    email = fake.email() if random.random() > 0.7 else ''
    gender = 'Male' if random.random() > 0.5 else 'Female'
    date_of_birth = fake.date()
    country_of_birth = fake.country().replace("'", "''")

    result.append(
        preffix + f"""values ('{first_name}', '{last_name}', '{email}', '{gender}', '{date_of_birth}', '{country_of_birth}');\n"""
    )


with open(sql_file_name, 'w') as file:
    file.write(db_create_scrypt)
    file.write(''.join(result))
