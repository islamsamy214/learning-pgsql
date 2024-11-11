WITH users_groups_cte AS (
    SELECT 
        ug.user_id, g.name 
    FROM user_groups AS ug 
    JOIN groups AS g
    ON g.id = ug.group_id
)
SELECT
    *
FROM
    users
JOIN
    users_groups_cte
ON users.id = users_groups_cte.user_id;