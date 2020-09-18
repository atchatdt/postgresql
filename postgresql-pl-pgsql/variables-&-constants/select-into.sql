-- 1
select *
into abc
from customer
order by customer_id
limit 10
offset 0;

select * from abc;

drop table if exists abc;

-- 2
do $$
declare
   actor_count integer; 
begin
   -- select the number of actors from the actor table
   select count(*) as counter 
   into actor_count
   from actor;

   -- show the number of actors
   raise notice 'The number of actors: %', actor_count;
end; $$

-- 3



















