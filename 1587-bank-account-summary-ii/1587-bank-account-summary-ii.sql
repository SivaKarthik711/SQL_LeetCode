# Write your MySQL query statement below
WITH Transactions_Balance AS
(SELECT
    DISTINCT Transactions.account,
    SUM(Transactions.amount) OVER (PARTITION BY Transactions.account) AS balance
FROM
    Transactions)

SELECT
    Users.name AS NAME,
    Transactions_Balance.balance AS BALANCE
FROM
    Users
LEFT JOIN
    Transactions_Balance
ON
    Users.account = Transactions_Balance.account
WHERE
    Transactions_Balance.balance > 10000

