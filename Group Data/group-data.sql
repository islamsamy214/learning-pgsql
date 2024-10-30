SELECT
    name as name_en,
    count(*) as count_of_appearence
FROM cities
WHERE
    name = 'Tokyo' AND area > 300 -- this to condition regular columns
GROUP BY
    name
HAVING
    count(*) > 1; -- but this to make inner condition for the GROUP