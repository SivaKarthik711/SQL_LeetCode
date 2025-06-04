# Write your MySQL query statement below
SELECT
        Signups.user_id,
    ROUND(
        COALESCE(
            SUM(CASE WHEN Confirmations.action = 'confirmed' THEN 1 ELSE 0 END) * 1.0 /
            NULLIF(COUNT(Signups.user_id), 0), 
            0
        ),
        2
    ) AS confirmation_rate
FROM
    Signups
LEFT JOIN
    Confirmations
ON
    Signups.user_id = Confirmations.user_id
GROUP BY
    Signups.user_id
ORDER BY
    Signups.user_id;
