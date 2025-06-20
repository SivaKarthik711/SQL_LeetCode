# Write your MySQL query statement below
SELECT
    customer_id
FROM
    Customers
WHERE
    revenue > 0 AND year = 2021
GROUP BY
    customer_id
