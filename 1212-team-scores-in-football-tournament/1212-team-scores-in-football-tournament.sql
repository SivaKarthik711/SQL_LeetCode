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
    t.team_id,
    t.team_name,
    COALESCE(SUM(p.points), 0) AS num_points
FROM Teams t
LEFT JOIN all_points p ON t.team_id = p.team_id
GROUP BY t.team_id, t.team_name
ORDER BY num_points DESC, t.team_id ;
