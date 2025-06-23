# Write your MySQL query statement below
WITH login_2020 AS (
    SELECT
        player_id,
        MIN(event_date) AS First_login
    FROM Activity
    GROUP BY player_id
)
SELECT *
FROM login_2020;
