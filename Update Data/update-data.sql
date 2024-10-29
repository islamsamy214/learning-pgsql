UPDATE
    cities
SET
    name = 'Alexandria',
    area = RANDOM() * 1000
WHERE
    area > 500;
