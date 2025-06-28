# Write your MySQL query statement below
WITH host_points AS (
    SELECT 
        host_team AS team_id,
        CASE 
            WHEN host_goals > guest_goals THEN 3
            WHEN host_goals = guest_goals THEN 1
            ELSE 0
        END AS points
    FROM Matches
),
guest_points AS (
    SELECT 
        guest_team AS team_id,
        CASE 
            WHEN guest_goals > host_goals THEN 3
            WHEN guest_goals = host_goals THEN 1
            ELSE 0
        END AS points
    FROM Matches
),
all_points AS (
    SELECT * FROM host_points
    UNION ALL
    SELECT * FROM guest_points
)

SELECT
    Teams.team_id,
    Teams.team_name,
    COALESCE(SUM(all_points.points),0) AS num_points
FROM
    Teams
LEFT JOIN
    all_points
ON
    Teams.team_id = all_points.team_id
GROUP BY
    Teams.team_id
ORDER BY
    num_points DESC,
    Teams.team_id
    