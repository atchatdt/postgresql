/*
	Sequence
	có thể ứng dụng tăng các số => không cần get => cộng => trả kết quả
*/

-- 1
CREATE SEQUENCE if not exists mysequence
INCREMENT 5
START 100;

-- 1.1

select nextval('mysequence')


-- 2
CREATE SEQUENCE if not exists three
INCREMENT -1
MINVALUE 1 
MAXVALUE 3
START 1
CYCLE;

-- 2.2
select nextval('three')

-- 2.3
DROP SEQUENCE if exists three

-- 3
CREATE TABLE order_details(
    order_id SERIAL,
    item_id INT NOT NULL,
    item_text VARCHAR NOT NULL,
    price DEC(10,2) NOT NULL,
    PRIMARY KEY(order_id, item_id)
);

-- 3.1

CREATE SEQUENCE order_item_id
START 10
INCREMENT 10
MINVALUE 10
OWNED BY order_details.item_id;


-- 3.2
INSERT INTO 
    order_details(order_id, item_id, item_text, price)
VALUES
    (100, nextval('order_item_id'),'DVD Player',100),
    (100, nextval('order_item_id'),'Android TV',550),
    (100, nextval('order_item_id'),'Speaker',250);

-- 3.3
SELECT
    order_id,
    item_id,
    item_text,
    price
FROM
    order_details;

-- 4
SELECT
    relname sequence_name
FROM 
    pg_class 
WHERE 
    relkind = 'S';

