/*Dấu chấm phẩy ; => báo hiệu kết thúc*/
select first_name from customer;
select count(customer_id) from customer;

SELECT
   first_name,
   last_name,
   email
FROM
   customer;
   
SELECT 
   (first_name || ' ' || last_name) as fullname,
   email
FROM 
   customer;
   
select 3*5