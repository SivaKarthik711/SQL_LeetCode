# Write your MySQL query statement below
WITH SalaryCategory AS (
    SELECT
        account_id,
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            WHEN income > 50000 THEN 'High Salary'
        END AS category
    FROM Accounts
),
AllCategories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
),
CategoryCounts AS (
    SELECT 
        category,
        COUNT(account_id) AS accounts_count
    FROM SalaryCategory
    GROUP BY category
)

SELECT
    AC.category,
    IFNULL(CC.accounts_count, 0) AS accounts_count
FROM AllCategories AC
LEFT JOIN CategoryCounts CC ON AC.category = CC.category;
