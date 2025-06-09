# Write your MySQL query statement below
SELECT
    *,
    (CASE WHEN Delivery.order_date = Delivery.customer_pref_delivery_date THEN 'immediate' ELSE 'scheduled') AS order_status
FROM
    Delivery;