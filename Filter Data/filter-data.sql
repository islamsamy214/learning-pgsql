SELECT 
    name,
    country,
    area
FROM
    cities
WHERE
    area > 222;
    

SELECT 
    name,
    country,
    area
FROM
    cities
WHERE
    area BETWEEN 222 AND 3333
    

SELECT 
    name,
    country,
    area
FROM
    cities
WHERE
    name NOT IN ('tokyo', 'yokahama')
AND 
    country NOT IN ('japan');