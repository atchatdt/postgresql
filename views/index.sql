-- -- Views -- --

-- create
CREATE VIEW customer_master AS
  SELECT cu.customer_id AS id,
    cu.first_name || ' ' || cu.last_name AS name,
    a.address,
    a.postal_code AS "zip code",
    a.phone,
    city.city,
    country.country,
        CASE
            WHEN cu.activebool THEN 'active'
            ELSE ''
        END AS notes,
    cu.store_id AS sid
   FROM customer cu
     INNER JOIN address a USING (address_id)
     INNER JOIN city USING (city_id)
     INNER JOIN country USING (country_id);


-- query
-- -- -- -- 
select * from customer_master;

-- -- -- -- 2 -- -- -- -- 
CREATE VIEW film_master 
AS
SELECT 
	film_id, 
	title, 
	release_year, 
	length, 
	name category
FROM 
	film
INNER JOIN film_category 
	USING (film_id)
INNER JOIN category 
	USING(category_id);


DROP VIEW film_master 
CASCADE;


select * from film_master






