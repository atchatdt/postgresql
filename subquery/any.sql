/*
	Any
	not in khác với <> any
	
	not in: không nằm trong danh sách
	<> any : chỉ cần khác 1 đứa, có thể nằm trong danh sách
*/

-- 1
SELECT title
FROM film
WHERE length >= ANY(
    SELECT MAX( length )
    FROM film
    INNER JOIN film_category USING(film_id)
    GROUP BY  category_id );

-- 2 => ANY = IN nếu toán tử so sánh là dấu =
SELECT
    title,
    category_id
FROM
    film
INNER JOIN film_category
        USING(film_id)
WHERE
    category_id = ANY(
        SELECT
            category_id
        FROM
            category
        WHERE
            NAME = 'Action'
            OR NAME = 'Drama'
    );





