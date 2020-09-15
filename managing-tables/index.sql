select * from links

-- add column
ALTER TABLE links
add column if not exists abc varchar(50),
add column if not exists xyz varchar(50)

-- drop column
alter table links
drop column if exists abc,
drop column if exists xyz


-- change data type

select * from assets

CREATE TABLE assets (
    id serial PRIMARY KEY,
    name TEXT NOT NULL,
    asset_no VARCHAR NOT NULL,
    description TEXT,
    location TEXT,
    acquired_date DATE NOT NULL
);

INSERT INTO assets(name,asset_no,location,acquired_date)
VALUES('Server','10001','Server room','2017-01-01'),
      ('UPS','10002','Server room','2017-01-01');

ALTER TABLE assets 
ALTER COLUMN location TYPE VARCHAR,
ALTER COLUMN description TYPE VARCHAR;

alter table assets
alter column acquired_date type DATE
USING acquired_date::date


-- rename column
select * from links

alter table links
rename xyz to kkk

-- drop table: default RESTRICT 
drop table if exists abcxyz CASCADE

-- temporary table => tạo table tạm, chỉ tồn tại trong phiên làm việc
create temporary table abc(
	id int primary key not null
)

-- copy table

CREATE TABLE contact(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL UNIQUE
);


INSERT INTO contact(first_name, last_name, email) 
VALUES('John','Doe','john.doe@postgresqltutorial.com'),
      ('David','William','david.william@postgresqltutorial.com');


CREATE TABLE contact_backup 
AS TABLE contact;

select * from contact_backup


ALTER TABLE contact_backup ADD PRIMARY KEY(id);
ALTER TABLE contact_backup ADD UNIQUE(email);

drop table contact_backup
