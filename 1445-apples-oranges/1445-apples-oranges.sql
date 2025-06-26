# Write your MySQL query statement below
WITH Apple_Sales AS (
   SELECT
        *
    FROM
        Sales
    WHERE
        fruit ='apples'
    ORDER BY
        sale_date),
Orange_Sales AS (
   SELECT
        *
    FROM
        Sales
    WHERE
        fruit ='oranges'
    ORDER BY
        sale_date)
SELECT
    Apple_Sales.sale_date,
    Apple_Sales.sold_num - Orange_Sales.sold_num as diff
FROM 
    Apple_Sales
JOIN
    Orange_Sales
ON
    Apple_Sales.sale_date = Orange_Sales.sale_date