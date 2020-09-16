-- CASE --
-- 1
SELECT title,
       length,
       CASE
           WHEN length> 0
                AND length <= 50 THEN 'Short'
           WHEN length > 50
                AND length <= 120 THEN 'Medium'
           WHEN length> 120 THEN 'Long'
       END duration
FROM film
ORDER BY title;

-- 2
SELECT
	SUM (CASE
               WHEN rental_rate = 0.99 THEN 1
	       ELSE 0
	      END
	) AS "Economy",
	SUM (
		CASE
		WHEN rental_rate = 2.99 THEN 1
		ELSE 0
		END
	) AS "Mass",
	SUM (
		CASE
		WHEN rental_rate = 4.99 THEN 1
		ELSE 0
		END
	) AS "Premium"
FROM
	film;


-- 3
SELECT title,
       rating,
       CASE rating
           WHEN 'G' THEN 'General Audiences'
           WHEN 'PG' THEN 'Parental Guidance Suggested'
           WHEN 'PG-13' THEN 'Parents Strongly Cautioned'
           WHEN 'R' THEN 'Restricted'
           WHEN 'NC-17' THEN 'Adults Only'
       END rating_description
FROM film
ORDER BY title;

-- 4
SELECT
       SUM(CASE rating
             WHEN 'G' THEN 1 
		     ELSE 0 
		   END) "General Audiences",
       SUM(CASE rating
             WHEN 'PG' THEN 1 
		     ELSE 0 
		   END) "Parental Guidance Suggested",
       SUM(CASE rating
             WHEN 'PG-13' THEN 1 
		     ELSE 0 
		   END) "Parents Strongly Cautioned",
       SUM(CASE rating
             WHEN 'R' THEN 1 
		     ELSE 0 
		   END) "Restricted",
       SUM(CASE rating
             WHEN 'NC-17' THEN 1 
		     ELSE 0 
		   END) "Adults Only"
FROM film;



-- COALESCE --
/*
	Không hỗ trợ ISNULL,
	dùng coalesce
	=> COALESCE(expression,replacement)
*/
select coalesce(null,1,2,3)

-- create
CREATE TABLE items (
	ID serial PRIMARY KEY,
	product VARCHAR (100) NOT NULL,
	price NUMERIC NOT NULL,
	discount NUMERIC
);

INSERT INTO items (product, price, discount)
VALUES
	('A', 1000 ,10),
	('B', 1500 ,20),
	('C', 800 ,5),
	('D', 500, NULL);

-- query
SELECT
	product,
	(price - discount) AS net_price
FROM
	items;
-- 
SELECT
	product,
	(price - COALESCE(discount,0)) AS net_price
FROM
	items;

-- 
SELECT
	product,
	(
		price - CASE
		WHEN discount IS NULL THEN
			0
		ELSE
			discount
		END
	) AS net_price
FROM
	items;

-- NULLIF
/*
	= nhau => null
	!= => trả về số đầu tiên
*/

-- create
CREATE TABLE posts (
  id serial primary key,
	title VARCHAR (255) NOT NULL,
	excerpt VARCHAR (150),
	body TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP
);

INSERT INTO posts (title, excerpt, body)
VALUES
      ('test post 1','test post excerpt 1','test post body 1'),
      ('test post 2','','test post body 2'),
      ('test post 3', null ,'test post body 3');

-- query
-- 
SELECT
	ID,
	title,
	excerpt
FROM
	posts;

-- 
SELECT
	id,
	title,
	COALESCE (excerpt, LEFT(body, 40))
FROM
	posts;

-- 
SELECT
	id,
	title,
	COALESCE (
		NULLIF (excerpt, ''),
		LEFT (body, 40)
	)
FROM
	posts;
-- 
CREATE TABLE members (
	ID serial PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	gender SMALLINT NOT NULL -- 1: male, 2 female
);

INSERT INTO members (
	first_name,
	last_name,
	gender
)
VALUES
	('John', 'Doe', 1),
	('David', 'Dave', 1),
	('Bush', 'Lily', 2);

SELECT
	(SUM (
		CASE
		WHEN gender = 1 THEN
			1
		ELSE
			0
		END
	) / SUM (
		CASE
		WHEN gender = 2 THEN
			1
		ELSE
			0
		END
	) ) * 100 AS "Male/Female ratio"
FROM
	members;


-- 
SELECT
	(
		SUM (
			CASE
			WHEN gender = 1 THEN
				1
			ELSE
				0
			END
		) / NULLIF (
			SUM (
				CASE
				WHEN gender = 2 THEN
					1
				ELSE
					0
				END
			),
			0
		)
	) * 100 AS "Male/Female ratio"
FROM
	members;


-- select * from members
-- delete from members where id = 3


-- CAST --

-- Chuyển đổi các kiểu dữ liệu


SELECT
  '100'::INTEGER,
  '01-OCT-2015'::DATE;


SELECT
	CAST ('10.2' AS DOUBLE PRECISION);



