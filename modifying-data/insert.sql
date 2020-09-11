/*
	Insert
*/

-- create
DROP TABLE IF EXISTS links;

CREATE TABLE links (
	id SERIAL PRIMARY KEY,
	url VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL,
	description VARCHAR (255) default 'đang cập nhật',
        last_update date default CURRENT_DATE
);

-- 1
INSERT INTO links (url, name)
VALUES('https://www.postgresqltutorial.com','PostgreSQL Tutorial');

-- 2
INSERT INTO links (url, name)
VALUES('http://www.oreilly.com','O''Reilly Media');

-- 3
INSERT INTO links (url, name, last_update)
VALUES('https://www.google.com','Google','2013-06-01');

-- 4
INSERT INTO links (url, name)
VALUES('http://www.postgresql.org','PostgreSQL') 
RETURNING id;

select * from links








