WITH Daily AS (
    SELECT visited_on, SUM(amount) AS daily_amount
    FROM Customer
    GROUP BY visited_on
),
Rolling_7_Day AS (
    SELECT 
        d1.visited_on,
        -- Sum of amounts over the 7-day window (used as 'amount' in output)
        (SELECT SUM(d2.daily_amount)
         FROM Daily d2
         WHERE d2.visited_on BETWEEN DATE_SUB(d1.visited_on, INTERVAL 6 DAY) AND d1.visited_on
        ) AS amount,
        -- Average over the 7-day window
        ROUND(
            (SELECT SUM(d2.daily_amount)
             FROM Daily d2
             WHERE d2.visited_on BETWEEN DATE_SUB(d1.visited_on, INTERVAL 6 DAY) AND d1.visited_on
            ) / 7, 2
        ) AS average_amount
    FROM Daily d1
)
SELECT *
FROM Rolling_7_Day
WHERE visited_on >= (
    SELECT MIN(visited_on) + INTERVAL 6 DAY
    FROM Customer
)
ORDER BY visited_on;
;
