-- 1
do $$ 
declare
   counter    integer = 1;
   first_name varchar(50) = 'John';
   last_name  varchar(50) = 'Doe';
   payment    numeric(11,2) = 20.5;
begin 
   raise notice '% % % has been paid % USD', 
       counter, 
	   first_name, 
	   last_name, 
	   payment;
end $$;

-- 2
do $$ 
declare
   created_at time := now();
begin 
   raise notice '%', created_at;
   perform pg_sleep(10);
   raise notice '%', created_at;
end $$;

-- 3
/**
   % để lưu giá trị của 1 cột trả về hoặc lấy giá trị từ biến khác
*/
do $$ 
declare
   film_title film.title%type;
   featured_title film_title%type;
begin 
   -- get title of the film id 100
   select title
   from film
   into film_title
   where film_id = 100;
   
   -- show the film title
   raise notice 'Film title id 100: %s', film_title;
end; $$

-- 4
do $$ 
<<outer_block>> -- tên custom
declare
  counter integer := 0;
begin
   counter := counter + 1;
   raise notice 'The current value of the counter is %', counter;

   declare
       counter integer := 0;
   begin
       counter := counter + 10;
       raise notice 'Counter in the subblock is %', counter;
       raise notice 'Counter in the outer block is %', outer_block.counter;
   end;

   raise notice 'Counter in the outer block is %', counter;
   
end outer_block $$;

-- 5
do $$ 
<<abc>>
declare
  counter integer := 0;
begin
   counter := counter + 1;
   raise notice 'The current value of the counter is %', counter;

   declare
       counter integer := 0;
   begin
       counter := counter + 10;
       raise notice 'Counter in the subblock is %', counter;
       raise notice 'Counter in the outer block is %', abc.counter;
   end;

   raise notice 'Counter in the outer block is %', counter;
   
end abc $$;

-- 6
do $$ <<abc>>
declare 
	counter integer = 1;
begin
	raise notice 'Start';
	counter = counter + 1;
	raise notice 'Counter %', counter;
	
	declare
		counter integer = 2;
	begin
		counter = counter + 20;
		raise notice 'In counter %', counter;
		raise notice 'Out counter %', abc.counter;
	end;
	raise notice 'End';
end abc $$;











