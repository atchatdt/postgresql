/*
	Group by
*/

-- 1
SELECT
   customer_id
FROM
   payment
GROUP BY
   customer_id;

-- 2
SELECT
	customer_id,
	SUM (amount) as total
FROM
	payment
GROUP BY
	customer_id
order by total DESC

-- 3: ussing => 2 cột trùng tên, điều kiện =
SELECT
	customer_id,
	first_name || ' ' || last_name full_name,
	SUM (amount) amount
FROM payment
INNER JOIN customer USING (customer_id)
GROUP BY customer_id
ORDER BY amount;

-- 4
SELECT
	staff_id,
	COUNT (payment_id)
FROM
	payment
GROUP BY
	staff_id;

-- 5
SELECT 
	customer_id, 
	staff_id, 
	SUM(amount) 
FROM 
	payment
GROUP BY 
	staff_id, 
	customer_id
ORDER BY 
    customer_id;

-- 6
SELECT 
	DATE(payment_date) paid_date, 
	SUM(amount) sum
FROM 
	payment
GROUP BY
	DATE(payment_date)
order by paid_date





