/*
Like
=> so sánh gần đúng
% => Khớp với bất kỳ chuỗi hoặc nhiều ký tự
_ => Khớp với ký tự đơn
~~ => like
~~* => ilike
!~~ => not like
!~~* => not ilike

*/

-- 1
SELECT
	first_name,
        last_name
FROM
	customer
WHERE
	first_name LIKE 'Jen%';

-- 2
SELECT
	'foo' LIKE 'foo', -- true
	'foo' LIKE 'f%', -- true
	'foo' LIKE '_o_', -- true
	'bar' LIKE 'b_'; -- false

-- 3
SELECT
	first_name,
        last_name
FROM
	customer
WHERE
	first_name LIKE '%er%'
ORDER BY 
        first_name;

-- 4: 1 ký tự bất kì + her + chuỗi ký tự bất kỳ
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name LIKE '_her%'
ORDER BY 
        first_name;

-- 5
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name NOT LIKE 'Jen%'
ORDER BY 
        first_name;

-- 6
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name ilike 'BAR%';








