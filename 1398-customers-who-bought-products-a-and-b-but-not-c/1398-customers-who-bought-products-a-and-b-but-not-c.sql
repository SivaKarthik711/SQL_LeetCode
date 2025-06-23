# Write your MySQL query statement below
WITH Product_A_Order AS (
    SELECT DISTINCT customer_id
    FROM Orders
    WHERE product_name = 'A'
),
Product_B_Order AS (
    SELECT DISTINCT customer_id
    FROM Orders
    WHERE product_name = 'B'
)

SELECT *
FROM Customers
WHERE customer_id IN (
    SELECT a.customer_id
    FROM Product_A_Order a
    INNER JOIN Product_B_Order b
    ON a.customer_id = b.customer_id
)
AND customer_id NOT IN (
    SELECT customer_id
    FROM Orders
    WHERE product_name = 'C'
);


