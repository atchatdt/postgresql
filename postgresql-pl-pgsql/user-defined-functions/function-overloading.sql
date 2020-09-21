-- -- -- -- Function overloading -- -- -- --
-- => giống như bên ngôn ngữ lập trình
-- => cùng tên, khác tham số truyền vào
-- 1
create or replace function get_rental_duration(
	p_customer_id integer
)
returns integer 
language plpgsql
as $$
declare 
	rental_duration integer; 
begin
	select 
		sum( extract(day from return_date - rental_date)) 
	into rental_duration 
    from rental 
	where customer_id = p_customer_id;

	return rental_duration;
end; $$


SELECT get_rental_duration(232);

-- 2
create or replace function get_rental_duration(
	p_customer_id integer, 
	p_from_date date
)
returns integer 
language plpgsql
as $$
declare 
	rental_duration integer;
begin
	-- get the rental duration based on customer_id 
	-- and rental date
	select sum( extract( day from return_date + '12:00:00' - rental_date)) 
	into rental_duration
	from rental 
	where customer_id = p_customer_id and 
		  rental_date >= p_from_date;
	
	-- return the rental duration in days
	return rental_duration;
end; $$

SELECT get_rental_duration(232,'2005-07-01');

-- 3
-- có thể bị nhầm lẫn với hàm 1 tham số => không biết phải thực thi hàm nào
-- => lỗi
create or replace function get_rental_duration(
	p_customer_id integer, 
	p_from_date date default '2005-01-01'
)
returns integer
language plpgsql
as $$
declare 
	rental_duration integer;
begin
	select sum( 
		extract( day from return_date + '12:00:00' - rental_date)
	) 
	into rental_duration
	from rental 
	where customer_id= p_customer_id and 
		  rental_date >= p_from_date;
	 
	return rental_duration;

end; $$

SELECT get_rental_duration(232);





