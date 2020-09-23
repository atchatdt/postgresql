-- -- -- -- 1 => create
SELECT * FROM address
WHERE phone = '223664661973';


EXPLAIN SELECT *
FROM address
WHERE phone = '223664661973';

CREATE INDEX idx_address_phone 
ON address(phone);


-- -- -- -- 2 => drop
create index idx_actor_first_name on actor (first_name);

select * from actor where first_name = 'John';

EXPLAIN SELECT *
FROM actor
WHERE first_name = 'John';

drop index if exists idx_actor_first_name;


-- -- -- -- 3 => list

SELECT
    *
FROM
    pg_indexes
WHERE
    schemaname = 'public'
ORDER BY
    tablename,
    indexname;


-- -- 
SELECT
    indexname,
    indexdef
FROM
    pg_indexes
WHERE
    tablename = 'customer';








