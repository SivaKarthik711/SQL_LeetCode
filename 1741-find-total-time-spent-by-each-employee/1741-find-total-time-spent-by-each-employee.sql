# Write your MySQL query statement below
WITH Employees_Time AS (
SELECT
    *,
    out_time - in_time as time_recorded
FROM
    Employees
    )
SELECT
    DISTINCT event_day as day,
    emp_id,
    SUM(time_recorded) OVER (PARTITION BY event_day,emp_id) AS total_time
FROM
    Employees_Time
ORDER BY
    event_day,emp_id 
