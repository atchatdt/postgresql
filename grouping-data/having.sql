/*
	Having
*/

-- 1
SELECT
	customer_id,
	SUM (amount)  total
FROM
	payment
GROUP BY
	customer_id
having SUM (amount) > 80

-- 2
SELECT
	store_id,
	COUNT (customer_id)
FROM
	customer
GROUP BY
	store_id
HAVING
	COUNT (customer_id) > 300;






