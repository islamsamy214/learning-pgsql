WITH RECURSIVE r_cte(val) AS (
    SELECT 10 as val
    UNION
    SELECT val - 1 FROM r_cte WHERE val > 1
)
SELECT *
FROM r_cte;
