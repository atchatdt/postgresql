-- Tím số chẵn từ 0 -> 10
-- hàm mod => chia lấy dư
/* Vòng lặp */
do $$
declare 
-- Khai báo biến
	n integer := 10;
	i integer := 0;
	arrayNumber integer[];
	j integer := 1;
	lengthArray integer;
begin
-- Vòng lặp
	loop
		exit when i > n;
		if (i % 2 = 0) then 
			arrayNumber := array_append(arrayNumber, i);
		end if;
		i := i + 1;
	end loop;
	raise notice 'i: %',i;
	
-- 	Lấy ra số lượng phần tử mảng => length
    select array_length(arrayNumber, 1) into lengthArray;
	
-- 	Xuất ra từng phần tử
	loop 
		exit when j > lengthArray;
		raise notice 'Item: % value: %', j, arrayNumber[j];
		j := j+1;
	end loop;
	
	raise notice 'Arrar: %', arrayNumber;
end;$$


/* Dùng while*/

do $$

declare
	n integer := 10;
	i integer := 0;
	arrayNumber integer[];
	j integer := 1;
	lengthArray integer;
begin
	while i <= n loop
			if (i % 2 = 0) then
				arrayNumber := array_append(arrayNumber, i);
			end if;
			i := i+1;
	end loop;
	
	select array_length(arrayNumber, 1) into lengthArray;
	
	while j < lengthArray loop
		raise notice 'Item %: %', j, arrayNumber[j];
		j := j+1;
	end loop;
	raise notice 'Arrar: %', arrayNumber;
end; $$

/* Dùng for*/
do $$
declare
	n integer := 10;
	arrayNumber integer[];
	j integer := 1;
	lengthArray integer;
begin
	for even in 0..n by 2 loop
		arrayNumber := array_append(arrayNumber, even);
	end loop;
	select array_length(arrayNumber, 1) into lengthArray;
	for counter in 1..lengthArray loop
		raise notice 'Item %: %', counter, arrayNumber[counter];
	end loop;
	raise notice 'Arrar: %', arrayNumber;
end $$;



-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- 1
do
$$
declare
    f record;
begin
    for f in select title, length 
	       from film 
	       order by length desc, title
	       limit 10 
    loop 
	raise notice '%(% mins)', f.title, f.length;
    end loop;
end;
$$

-- 2
do $$
declare
    -- sort by 1: title, 2: release year
    sort_type smallint := 1; 
	-- return the number of films
	rec_count int := 10;
	-- use to iterate over the film
	rec record;
	-- dynamic query
    query text;
begin
		
	query := 'select title, release_year from film ';
	
	if sort_type = 1 then
		query := query || 'order by title';
	elsif sort_type = 2 then
	  query := query || 'order by release_year';
	else 
	   raise 'invalid sort type %s', sort_type;
	end if;

	query := query || ' limit $1';

	for rec in execute query using rec_count
        loop
	     raise notice '% - %', rec.release_year, rec.title;
	end loop;
end;
$$

-- -- -- -- -- -- -- -- 
-- Exit
/*
if (phép so sánh) = >exit
exit when (phép so sánh)

*/



