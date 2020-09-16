/*
	Index
*/

-- Boolean
CREATE TABLE if not exists  stock_availability (
   product_id INT PRIMARY KEY,
   available BOOLEAN NOT NULL
);

INSERT INTO stock_availability (product_id, available)
VALUES
	(100, TRUE),
	(200, FALSE),
	(300, 't'),
	(400, '1'),
	(500, 'y'),
	(600, 'yes'),
	(700, 'no'),
	(800, '0');

select * from stock_availability;

-- char, varchar, text

-- Date
SELECT TO_CHAR(NOW() :: DATE, 'dd/mm/yyyy');

-- time
SELECT typname,
      typlen
FROM pg_type
WHERE typname ~ '^timestamp';

-- interval
SELECT
	now(),
	now() - INTERVAL '1 year 3 hours 20 minutes' 
             AS "3 hours 20 minutes ago of last year";


SET intervalstyle = 'sql_standard';

SELECT
	INTERVAL '6 years 5 months 4 days 3 hours 2 minutes 1 second';


SET intervalstyle = 'postgres';

SELECT
	INTERVAL '6 years 5 months 4 days 3 hours 2 minutes 1 second';


SET intervalstyle = 'postgres_verbose';

SELECT
	INTERVAL '6 years 5 months 4 days 3 hours 2 minutes 1 second';


SET intervalstyle = 'iso_8601';

SELECT
	INTERVAL '6 years 5 months 4 days 3 hours 2 minutes 1 second';



-- hsrote
CREATE EXTENSION hstore;

CREATE TABLE if not exists books (
	id serial primary key,
	title VARCHAR (255),
	attr hstore
);

INSERT INTO books (title, attr)
VALUES
	(
		'PostgreSQL Tutorial',
		'"paperback" => "243",
	   "publisher" => "postgresqltutorial.com",
	   "language"  => "English",
	   "ISBN-13"   => "978-1449370000",
		 "weight"    => "11.2 ounces"'
	);


INSERT INTO books (title, attr)
VALUES
	(
		'PostgreSQL Cheat Sheet',
		'
"paperback" => "5",
"publisher" => "postgresqltutorial.com",
"language"  => "English",
"ISBN-13"   => "978-1449370001",
"weight"    => "1 ounces"'
	);


-- 
SELECT
	attr
FROM
	books;
-- 
SELECT
	attr -> 'ISBN-13' AS isbn
FROM
	books;



