# Write your MySQL query statement below
WITH Person_required AS (
    SELECT MIN(id) AS min_id
    FROM Person
    GROUP BY email
)
DELETE FROM Person
WHERE id NOT IN (
    SELECT min_id FROM Person_required
);




