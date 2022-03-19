# DataBase

## 011 -Northwind

[GitHub Northwind](https://github.com/pthom/northwind_psql)
[Northwind](https://1drv.ms/u/s!AqtQeAOHZEjQuqteZmactYPQo1--Gg?e=waXi8e)

```sh
psql -h localhost -p 5432 -U example -d example
```

```sh
psql -h localhost -p 5432 -U example -d test
```

password: example

[Learn PostgreSQL Tutorial - Full Course for Beginners](https://www.youtube.com/watch?v=qw--VYLpxG4&list=PLZ2fBjw2qEyXHwZ8EgV_tiq5sStHwWLli&index=3)

in psql:

- `\c db_name` - to connect db_mane data base
- `\d` - tables list
- `\d table_name` - table info
- `\dt` - show only tables
- `\?` - commands list
- `\i FILE` - execute commands from file
- `\x [on|off|auto]` -  toggle expanded output (currently off)
- `\copy ...` - perform SQL COPY with data stream to the client host
- `\df[anptw][S+] [PATRN] list [only agg/normal/procedures/trigger/window] functions`

## [Postgresql Aggregate Functions](https://www.postgresql.org/docs/current/functions-aggregate.html)

## [Date/Time Types](https://www.postgresql.org/docs/14/datatype-datetime.html)

## [Faker](https://faker.readthedocs.io/en/master/index.html)

## [faker-vehicle](https://pypi.org/project/faker-vehicle/)
