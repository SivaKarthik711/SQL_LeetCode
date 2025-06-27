SELECT DISTINCT
    c.title AS TITLE
FROM
    TVProgram t
JOIN
    Content c ON t.content_id = c.content_id
WHERE
    c.Kids_content = 'Y'
    AND c.content_type = 'Movies'
    AND MONTH(t.program_date) = 6
    AND YEAR(t.program_date) = 2020;
