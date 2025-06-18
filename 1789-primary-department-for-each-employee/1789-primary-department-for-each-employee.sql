# Write your MySQL query statement below
WITH GG AS (
    SELECT
        *,
        COUNT(department_id) OVER (PARTITION BY employee_id ORDER BY employee_id) as count_departments
    FROM
        Employee
)
SELECT employee_id, department_id
FROM GG
WHERE (count_departments = 1)
   OR (primary_flag = 'Y');






