# Write your MySQL query statement below
SELECT name
FROM Employee
WHERE id IN (
    Select managerId
    From Employee 
    Where managerId IS NOT NULL
    having Count(id) >= 5
);
