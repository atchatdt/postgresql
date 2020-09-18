select 'String constant';

select 'I''m also a string constant';

select $$I'm a string constant that contains a backslash \$$;

SELECT $message$I'm a string constant that contains a backslash \$message$;

-- 
do 
'declare
   film_count integer;
begin 
   select count(*) into film_count
   from film;
   raise notice ''The number of films: %'', film_count;
end;';

-- 
do 
$$
declare
   film_count integer;
begin 
   select count(*) into film_count
   from film;
   raise notice 'The number of films: %', film_count;
end;
$$

-- 
do $$ 
<<first_block>>
declare
  film_count integer := 0;
begin
   -- get the number of films
   select count(*) 
   into film_count
   from film;
   -- display a message
   raise notice 'The number of films is %', film_count;
end first_block $$;








