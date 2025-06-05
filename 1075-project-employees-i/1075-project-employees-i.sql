# Write your MySQL query statement below
SELECT
    Project.project_id,
    ROUND(COALESCE(SUM(Employee.experience_years)/NULLIF(COUNT(Project.employee_id),0),0),2) as average_years
FROM
    Project
LEFT JOIN
    Employee
ON
    Project.employee_id = Employee.employee_id
GROUP BY
    Project.project_id;
