/* ORDER BY
ASC: tăng dần
DESC: giảm dần
Mặc định: ASC
=> nó thực hiện sau lệnh select => nên trực tiếp lấy kết quả trả về order luôn
Null: NULLS LAST || NULLS FIRST

*/

/*1*/
SELECT
	customer_id,
	first_name,
	last_name
FROM
	customer
ORDER BY
	customer_id DESC,
	first_name ASC

/*2*/
SELECT 
	first_name,
	LENGTH(first_name) len
FROM
	customer
ORDER BY 
	len DESC;

-- Giá trị null + order
-- create a new table
CREATE TABLE sort_demo(
	num INT
);
-- insert some data
INSERT INTO sort_demo(num)
VALUES(1),(2),(3),(null);

SELECT num
FROM sort_demo
ORDER BY num nulls first;








