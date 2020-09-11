/*
    Select into
	=> tạo bảng mới từ kết quả của 1 câu truy vấn
*/

-- 1
SELECT
    film_id,
    title,
    rental_rate
INTO TABLE film_r
FROM
    film
WHERE
    rating = 'R'
AND rental_duration = 5
ORDER BY
    title;
	
-- 2
select * from film_r

-- 3: tạo bảng tạm thời
SELECT
    film_id,
    title,
    length 
INTO TEMP TABLE short_film
FROM
    film
WHERE
    length < 60
ORDER BY
    title;
-- 3.1
select * from short_film








