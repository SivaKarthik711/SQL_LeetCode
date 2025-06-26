# Write your MySQL query statement below
SELECT
    *,
    DENSE_RANK() OVER (ORDER BY from_id) AS row_num
FROM
    Calls
WHERE from_id < to_id;

