# Write your MySQL query statement below
SELECT
    T1.id
FROM
    Weather AS T1
JOIN
    Weather AS T2
ON
    DATEDIFF(T1.recordDate, T2.recordDate) = 1
WHERE
    T1.temperature > T2.temperature;



