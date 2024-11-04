SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    CASE
        WHEN salary < 50000 THEN 'Low'
        WHEN salary < 100000 THEN 'Medium'
        ELSE 'High'
    END AS salary_category
FROM
    employees;