# Write your MySQL query statement below
WITH FirstLogins AS (
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
),
NextDayLogins AS (
    SELECT f.player_id
    FROM FirstLogins f
    JOIN Activity a
        ON f.player_id = a.player_id
        AND a.event_date = DATE_ADD(f.first_login_date, INTERVAL 1 DAY)
)

SELECT
    ROUND(
        COUNT(DISTINCT n.player_id) / COUNT(DISTINCT f.player_id),
        2
    ) AS fraction
FROM
    FirstLogins f
LEFT JOIN NextDayLogins n
    ON f.player_id = n.player_id;
