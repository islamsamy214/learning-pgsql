SELECT name, area
FROM cities
WHERE name IN (
        SELECT name FROM cities
    )

SELECT name, (SELECT COUNT(*) FROM cities)
FROM cities