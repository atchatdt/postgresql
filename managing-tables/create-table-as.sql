/*
	Create table as
*/

-- 1
create temp table abcxyz
as (select * from actor)

select * from abcxyz

-- 2
CREATE TABLE if not exists action_film AS
SELECT
    film_id,
    title,
    release_year,
    length,
    rating
FROM
    film
INNER JOIN film_category USING (film_id)
WHERE
    category_id = 1;

select * from action_film

-- 3
CREATE TABLE IF NOT EXISTS film_rating (rating, film_count) 
AS 
SELECT
    rating,
    COUNT (film_id)
FROM
    film
GROUP BY
    rating;

select * from film_rating
