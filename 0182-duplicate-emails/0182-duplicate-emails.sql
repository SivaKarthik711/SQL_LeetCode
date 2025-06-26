# Write your MySQL query statement below
WITH Person_Count AS
(SELECT
    *,
    COUNT(Person.email) AS counts
FROM
    Person
GROUP BY
    Person.email)
SELECT
    Person_Count.email AS Email
FROm
    Person_Count
WHERE
    Person_Count.counts >1
