# Write your MySQL query statement below
WITH Rides_Required AS (
SELECT
    Rides.user_id,
    SUM(Rides.distance) OVER (PARTITION BY Rides.user_id) AS travelled_distance
FROM
    Rides
)

SELECT
    DISTINCT Users.name,
   IFNULL(Rides_Required.travelled_distance,0) as travelled_distance
FROM
    Users
LEFT JOIN
    Rides_Required
ON
    Users.id = Rides_Required.user_id
ORDER BY
    travelled_distance DESC,
    name
