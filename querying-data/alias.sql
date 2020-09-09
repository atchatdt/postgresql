/*Column Alias*/
SELECT 
   first_name, 
   last_name AS surname
FROM customer;

SELECT
    first_name || ' ' || last_name AS full_name
FROM
    customer;
select * from customer