# Write your MySQL query statement below
WITH Orders_filtered AS (
    SELECT 
        product_id,
        YEAR(order_date) AS order_year,
        SUM(unit) AS total_units
    FROM Orders
    WHERE MONTH(order_date) = 2
    GROUP BY product_id, YEAR(order_date)
    HAVING SUM(unit) >= 100
)

SELECT 
    P.product_name,
    O.total_units AS unit
FROM 
    Orders_filtered O
JOIN 
    Products P 
ON 
    O.product_id = P.product_id;


