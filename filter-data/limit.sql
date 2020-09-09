/*
Limit: số phần tử giới hạn
OFFSET: skip => nhảy bậc => vị trí(bắt đầu từ 0)
*/

-- 1
select *
from customer
order by customer_id
limit 5 
offset 0;

-- 2
SELECT
	film_id,
	title,
	release_year
FROM
	film
ORDER BY
	film_id
LIMIT 5;

-- 3
SELECT
	film_id,
	title,
	release_year
FROM
	film
ORDER BY
	film_id
LIMIT 4 OFFSET 3;

-- 4
SELECT
	film_id,
	title,
	rental_rate
FROM
	film
ORDER BY
	rental_rate DESC
LIMIT 10;


















