# Write your MySQL query statement below
WITH Workers AS (
    SELECT *
    FROM Employees
    WHERE reports_to IS NOT NULL
)

SELECT
    E.employee_id,
    E.name,
    COUNT(DISTINCT W.employee_id) AS reports_count,
    ROUND(AVG(W.age), 0) AS average_age
FROM
    Employees E
INNER JOIN
    Workers W
ON
    E.employee_id = W.reports_to
GROUP BY
    E.employee_id, E.name
ORDER BY
    E.employee_id;
