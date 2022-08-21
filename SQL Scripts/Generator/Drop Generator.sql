-- Constraints

select
concat('alter table ', table_name, ' drop constraint ', quote_ident(constraint_name), ';') as Drop
from information_schema.constraint_table_usage

-- Tables

SELECT
concat('drop table ', table_name,';') as Drop
FROM information_schema.tables
WHERE
    table_schema = 'public';

-- Sequences

SELECT
concat('drop sequence ', sequence_name,';') as Drop
FROM information_schema.sequences
WHERE
    sequence_schema = 'public'
order by 1 desc;

-- Enumerators

select
concat('drop type ', typname,';') as Drop
from pg_type
where
    typtype = 'e'

---------------------------------------------

DO $body$
DECLARE r record;
BEGIN
    FOR r IN SELECT table_name,constraint_name
             FROM information_schema.constraint_table_usage
    LOOP
       EXECUTE 'ALTER TABLE ' || quote_ident(r.table_name)|| ' DROP CONSTRAINT '|| quote_ident(r.constraint_name) || ';';
    END LOOP;
END
$body$;