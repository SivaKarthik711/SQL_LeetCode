# Write your MySQL query statement below
SELECT

    ROUND((SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END)*1.0/COUNT(delivery_id))*100,2) as immediate_percentage
FROM
    Delivery