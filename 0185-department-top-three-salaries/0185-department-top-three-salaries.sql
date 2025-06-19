# Write your MySQL query statement below
WITH Ranked_Salary AS (
    SELECT 
        Employee.name AS Employee,
        Employee.departmentId,
        Employee.salary AS Salary,
        DENSE_RANK() OVER (PARTITION BY Employee.departmentId ORDER BY Employee.salary DESC) AS salary_rank
    FROM Employee
)

SELECT 
    Department.name AS Department,
    Ranked_Salary.Employee,
    Ranked_Salary.Salary
FROM Ranked_Salary
JOIN Department
    ON Ranked_Salary.departmentId = Department.id
WHERE Ranked_Salary.salary_rank <= 3;


