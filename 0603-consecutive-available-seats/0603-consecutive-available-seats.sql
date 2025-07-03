WITH FreeSeats AS (
    SELECT *
    FROM Cinema
    WHERE free = 1
),
Numbered AS (
    SELECT 
        seat_id,
        ROW_NUMBER() OVER (ORDER BY seat_id) AS rn
    FROM FreeSeats
),
Grouped AS (
    SELECT 
        seat_id,
        seat_id - rn AS grp
    FROM Numbered
),
Filtered AS (
    SELECT 
        grp,
        COUNT(*) AS cnt
    FROM Grouped
    GROUP BY grp
    HAVING COUNT(*) >= 2
)
SELECT 
    fs.seat_id
FROM 
    Grouped g
JOIN 
    Filtered f
ON 
    g.grp = f.grp
JOIN 
    FreeSeats fs
ON 
    fs.seat_id = g.seat_id
ORDER BY 
    fs.seat_id;
