# Write your MySQL query statement below
SELECT
    Activity_start.machine_id,
    ROUND(AVG(Activity_end.timestamp - Activity_start.timestamp), 3) AS processing_time
FROM
    (SELECT * FROM Activity WHERE activity_type = 'start') AS Activity_start
JOIN
    (SELECT * FROM Activity WHERE activity_type = 'end') AS Activity_end
ON
    Activity_start.machine_id = Activity_end.machine_id
    AND Activity_start.process_id = Activity_end.process_id
GROUP BY
    Activity_start.machine_id;


