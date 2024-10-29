SELECT
    name,
    country,
    SUM(area)
FROM
    cities
GROUP BY
    name,
    country