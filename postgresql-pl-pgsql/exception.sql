-- -- -- -- Exception -- -- -- --
-- 1
do
$$
declare
	rec record;
	v_film_id int = 2000;
begin
	-- select a film 
	select film_id, title 
	into strict rec
	from film
	where film_id = v_film_id;
end;
$$
language plpgsql;


-- 2
do
$$
declare
	rec record;
	v_film_id int = 2000;
begin
	-- select a film 
	select film_id, title 
	into strict rec
	from film
	where film_id = v_film_id;
        -- catch exception
	exception 
	   when no_data_found then 
	      raise exception 'film % not found', v_film_id;
end;
$$
language plpgsql;

-- 3
do
$$
declare
	rec record;
begin
	-- select film 
	select film_id, title 
	into strict rec
	from film
	where title LIKE 'A%';
	
	exception 
	   when too_many_rows then
	      raise exception 'Search query returns too many rows';
end;
$$
language plpgsql;


-- 3
do
$$
declare
	rec record;
	v_length int = 90;
begin
	-- select a film 
	select film_id, title 
	into strict rec
	from film
	where length = v_length;
	
        -- catch exception
	exception 
	   when sqlstate 'P0002' then 
	      raise exception 'film with length % not found', v_length;
	   when sqlstate 'P0003' then 
	      raise exception 'The with length % is not unique', v_length;
end;
$$
language plpgsql;







