--- Reporting messages and errors ---

-- Errors and Messages --
-- 1
do $$ 
begin 
  raise info 'information message %', now() ;
  raise log 'log message %', now();
  raise debug 'debug message %', now();
  raise warning 'warning message %', now();
  raise notice 'notice message %', now();
end $$;

-- 2
do $$ 
declare
  email varchar(255) := 'info@postgresqltutorial.com';
begin 
  -- check email for duplicate
  -- ...
  -- report duplicate email
  raise exception 'duplicate email: %', email 
		using hint = 'check the email again';
end $$;

-- Assert Statement --
-- 1

do $$
declare 
   film_count integer;
begin
   select count(*)
   into film_count
   from film;
   
   assert film_count > 0, 'Film not found, check the film table';
end$$;









