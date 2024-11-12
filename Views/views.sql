CREATE VIEW roles AS (
    SELECT 
        u.id , u.name, g.name as role, 'custom_col' as custom_column
    FROM users as u
    JOIN user_groups as ug on ug.user_id = u.id
    JOIN groups as g on ug.group_id = g.id
);

SELECT * FROM roles;
