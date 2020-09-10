/*
	Except
*/

-- 1
SELECT * FROM top_rated_films
EXCEPT 
SELECT * FROM most_popular_films;

-- 2
SELECT * FROM top_rated_films
EXCEPT 
SELECT * FROM most_popular_films
ORDER BY title;