# Write your MySQL query statement below
WITH Ranked AS (
    SELECT *,
           RANK() OVER (
               PARTITION BY student_id 
               ORDER BY grade DESC, course_id ASC
           ) AS rnk
    FROM Enrollments
)
SELECT student_id, course_id, grade
FROM Ranked
WHERE rnk = 1
ORDER BY student_id;
