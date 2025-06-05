
-- Get price applicable at the time of purchase
SELECT
    p.product_id,
    ROUND(SUM(p.price * u.units) / NULLIF(SUM(u.units), 0), 2) AS average_price
FROM 
    Prices p
JOIN
    UnitsSold u
ON
    p.product_id = u.product_id
WHERE
    u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY
    p.product_id;
