-- -- -- -- Function That Returns a Table -- -- -- --

-- 1
create or replace function get_film (
  p_pattern varchar
) 
	returns table (
		film_id_id integer,
		film_title varchar,
		film_release_year int
	) 
	language plpgsql
as $$
begin
	return query 
		select
			film_id,
			title,
			release_year::integer
		from
			film
		where
			title ilike p_pattern;
end;$$

select * from get_film('%Ali%') where film_id_id > 113 order by film_id_id

drop function if exists get_film


-- 2
create or replace function get_film (
	p_pattern varchar,
	p_year int
) 
returns table (
	film_title varchar,
	film_release_year int
) 
language plpgsql
as $$
declare 
    var_r record;
begin
	for var_r in(
            select title, release_year 
            from film 
	     where title ilike p_pattern and 
		    release_year = p_year
        ) loop  film_title := upper(var_r.title) ; 
		film_release_year := var_r.release_year;
           return next;
	end loop;
end; $$

SELECT * FROM get_film ('%er', 2006);



