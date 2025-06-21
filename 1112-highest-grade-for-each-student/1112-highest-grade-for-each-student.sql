# Write your MySQL query statement below
SELECT student_id, course_id, grade
FROM (
    SELECT 
        student_id, 
        course_id, 
        grade,
        ROW_NUMBER() OVER (
            PARTITION BY student_id 
            ORDER BY grade DESC, course_id ASC
        ) AS rn
    FROM Enrollments
) AS ranked
WHERE rn = 1;
