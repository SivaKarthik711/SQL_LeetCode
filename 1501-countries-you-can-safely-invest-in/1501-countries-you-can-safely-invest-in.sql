SELECT
    Country.name as country
FROM
    Person
JOIN
    Country
ON
    SUBSTRING_INDEX(Person.phone_number,'-',1) = Country.country_code
JOIN
    Calls
ON
    Person.id IN (Calls.caller_id,Calls.callee_id)
GROUP BY
    Country.name
HAVING
    AVG(duration) > (SELECT AVG(duration) FROM Calls)
 