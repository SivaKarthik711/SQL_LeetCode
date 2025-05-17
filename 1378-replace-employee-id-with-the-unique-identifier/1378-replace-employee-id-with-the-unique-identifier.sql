# Write your MySQL query statement below
SELECT
    unique_id, name
FROM 
    Employees
LEFT JOIN #JOIN performs inner join which elminates NULL values present in unique_id
    EmployeeUNI
ON
    Employees.id = EmployeeUNI.id
ORDER BY
    unique_id;
