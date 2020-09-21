-- -- -- -- Function Parameter Modes: IN, OUT, INOUT -- -- -- --  

-- 1
create or replace function find_film_by_id(p_film_id int)
returns varchar
language plpgsql
as $$
declare
   film_title film.title%type;
begin
  -- find film title by id
  select title 
  into film_title
  from film
  where film_id = p_film_id;
  
  if not found then
--      raise 'Film with id % not found', p_film_id;
	film_title:= '404 not found';
  end if;
  
  return film_title;
  
end;$$

select find_film_by_id(1111111)

-- 2
/*
	
	trả về nhiều kết quả => dùng từ khoá out
	trong cùng 1 ô, cách nhau bởi dấu phẩy => nếu chỉ dùng select + tên function
	select * from tên fuction => trả về từng kết quả theo cột
*/
create or replace function get_film_stat(
    out min_len int ,
    out max_len int,
    out avg_len numeric) 
language plpgsql
as $$
begin
  
  select min(length),
         max(length),
		 avg(length)::numeric(5,1)
  into min_len, max_len, avg_len
  from film;

end;$$


select * from get_film_stat();
drop function if exists get_film_stat

-- 3
-- Hoán vị
create or replace function swap(
	inout x int,
	inout y int
) 
language plpgsql	
as $$
begin
   select x,y into y,x;
end; $$;

select *from swap(5,6)






