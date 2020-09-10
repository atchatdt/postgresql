/*
	Exists
	Null => true
	1 hàng => true
	0 hàng false
*/

-- 1
SELECT first_name,
       last_name
FROM customer c
WHERE EXISTS
    (SELECT 1
     FROM payment p
     WHERE p.customer_id = c.customer_id
       AND amount > 11 )
ORDER BY first_name,
         last_name;

-- 2
SELECT first_name,
       last_name
FROM customer c
WHERE NOT EXISTS
    (SELECT 1
     FROM payment p
     WHERE p.customer_id = c.customer_id
       AND amount > 11 )
ORDER BY first_name,
         last_name;


-- 3
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	EXISTS( SELECT NULL )
ORDER BY
	first_name,
	last_name;






