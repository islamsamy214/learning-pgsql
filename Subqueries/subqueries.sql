SELECT name, area
FROM cities
WHERE name IN (
        SELECT name FROM cities
    )