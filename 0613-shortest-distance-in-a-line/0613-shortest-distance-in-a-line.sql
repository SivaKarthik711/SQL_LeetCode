SELECT
    MIN(next_point - x) AS shortest
FROM (
    SELECT
        x,
        LEAD(x) OVER (ORDER BY x) AS next_point
    FROM
        Point
) AS Point_Next
WHERE
    next_point IS NOT NULL;

