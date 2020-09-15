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

select * from stock_availability








