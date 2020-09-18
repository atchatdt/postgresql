-- ROW TYPES --
-- 1
do $$
declare
   selected_actor actor%rowtype;
begin
   -- select actor with id 10   
   select * 
   from actor
   into selected_actor
   where actor_id = 10;

   -- show the number of actor
   raise notice 'The actor name is % %',
      selected_actor.first_name,
      selected_actor.last_name;
end; $$

-- RECORD TYPES --

-- 1
do
$$
declare
	rec record;
begin
	-- select the film 
	select film_id, title, length 
	into rec
	from film
	where film_id = 200;
	
	raise notice '% % %', rec.film_id, rec.title, rec.length;   
	
end;
$$
language plpgsql;

-- 2
do
$$
declare
	rec record;
begin
	for rec in select title, length 
			from film 
			where length > 50
			order by length
			limit 10
			offset 0
	loop
		raise notice '% (%)', rec.title, rec.length;	
	end loop;
end;
$$

-- PL/pgSQL Constants --

-- 1
do $$ 
declare
   vat constant numeric := 0.1;
   net_price    numeric := 20.5;
begin
   raise notice 'The selling price is %', net_price * ( 1 + vat );
end $$;

-- 2 => error: biến dạng const => giá trị không đổi
do $$ 
declare
   vat constant numeric := 0.1;
   net_price    numeric := 20.5;
begin 
   raise notice 'The selling price is %', net_price * ( 1 + vat);
   vat := 0.05;
end $$;

-- 3
do $$ 
declare
   start_at constant time := now();
begin
   raise notice 'Start executing block at %', start_at;
end $$;



