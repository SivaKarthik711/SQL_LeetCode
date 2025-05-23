# Write your MySQL query statement below
SELECT
    name
FROM
    Employee
WHERE
    ID 
IN
    (
        SELECT
            managerId
        FROM
            Employee
        WHERE
            managerId IS NOT NULL
        GROUP BY
            managerId
        HAVING
            COUNT(id) >= 5
    )
;