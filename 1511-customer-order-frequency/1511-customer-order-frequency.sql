SELECT
    customer_id,
    name
FROM (
    SELECT
        c.customer_id,
        c.name,
        MONTH(o.order_date) AS order_month,
        SUM(p.price * o.quantity) AS total_spent
    FROM
        Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Product p ON o.product_id = p.product_id
    WHERE
        o.order_date BETWEEN '2020-06-01' AND '2020-07-31'
    GROUP BY
        c.customer_id,
        MONTH(o.order_date)
) AS MonthlySpending
GROUP BY
    customer_id,
    name
HAVING
    COUNT(*) = 2 AND
    MIN(total_spent) >= 100;
