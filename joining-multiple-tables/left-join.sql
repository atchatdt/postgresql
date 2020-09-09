/*
	Left join
*/
-- 1
select 
	inv.inventory_id,
	film.film_id,
	title
from film
left join inventory as inv
on inv.film_id = film.film_id
order by inv.inventory_id

-- 2
SELECT
	f.film_id,
	title,
	inventory_id
FROM
	film f
LEFT JOIN inventory i
   ON i.film_id = f.film_id
WHERE i.film_id IS NULL
ORDER BY title;






