# Write your MySQL query statement below
SELECT name
FROM Employee
WHERE id IN (
    Select managerId
    From Employee 
    Where managerId IS NOT NULL
    Group By managerId
    having Count(id) >= 5
);
