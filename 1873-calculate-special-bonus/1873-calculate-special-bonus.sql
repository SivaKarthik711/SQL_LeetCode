# Write your MySQL query statement below
SELECT
    Employees.employee_id,
    CASE WHEN Employees.employee_id % 2 = 1  AND Employees.name NOT LIKE 'M%' THEN salary ELSE 0 END AS bonus
FROM
    Employees