WITH Pair_Count AS 
(SELECT
                actor_id,
                director_id,
                COUNT(*) AS pair_count
            FROM
                ActorDirector
            GROUP BY
                actor_id,
                director_id)
SELECT
    actor_id,
    director_id
FROM
    Pair_Count
HAVING
    COUNT(*) = MAX(pair_count)