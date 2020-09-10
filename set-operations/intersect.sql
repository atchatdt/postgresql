/*
	Intersect
*/

-- 1
SELECT *
FROM most_popular_films 
INTERSECT
SELECT *
FROM top_rated_films;

-- 2
select m.title, m.release_year
from most_popular_films m
inner join top_rated_films  using(title)

