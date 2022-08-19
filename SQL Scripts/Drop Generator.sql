SELECT
concat('drop table ', table_name,';') as Drop
FROM information_schema.tables
WHERE
    table_schema = 'public'


UNION ALL

SELECT
concat('drop sequence ', sequence_name,';') as Drop
FROM information_schema.sequences
WHERE
    sequence_schema = 'public'
order by 1 desc;
