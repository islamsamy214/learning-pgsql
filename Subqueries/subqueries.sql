SELECT name, area
FROM cities
WHERE name IN (
        SELECT name FROM cities
    ) -- when its in where condition the return has to be a single column

SELECT name, (SELECT COUNT(*) FROM cities) -- when it is in select statement the return has to be a single value, one column and one row
FROM cities

SELECT name, area
FROM (
    SELECT name, area FROM cities -- when its in from clause it can be a table
)
WHERE area > 20;