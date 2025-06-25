# Write your MySQL query statement below
WITH Volume AS (
SELECT
    Products.product_name,
    Products.Width,
    Products.Length,
    Products.Height,
    Warehouse.units,
    Warehouse.product_id,
    (Products.Width*Products.Length*Products.Height*Warehouse.units) AS volume,
    Warehouse.name
FROM
    Products
RIGHT JOIN
    Warehouse
ON
    Warehouse.product_id = Products.product_id
)

SELECT
    DISTINCT Volume.name AS warehouse_name,
    SUM(volume) OVER (PARTITION BY Volume.name) AS volume
FROM
     Volume

    