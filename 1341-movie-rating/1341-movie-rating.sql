# Write your MySQL query statement below
WITH User_rating AS (
    SELECT
        u.name as results
    FROM
        Users u
    JOIN
        MovieRating mr ON u.user_id = mr.user_id
    GROUP BY
        u.user_id, u.name
    ORDER BY
        COUNT(mr.movie_id) DESC,
        u.name
    LIMIT 1
),

Movies_rating AS (
    SELECT
        m.title as results
    FROM
        Movies m
    JOIN
        MovieRating mr ON m.movie_id = mr.movie_id
    WHERE
        mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY
        m.movie_id, m.title
    ORDER BY
        AVG(mr.rating) DESC,
        m.title
    LIMIT 1
)

SELECT * FROM User_rating
UNION ALL
SELECT * FROM Movies_rating;
