/*
	Transactions
*/

-- create
DROP TABLE  IF EXISTS accounts;

CREATE TABLE accounts (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    balance DEC(15,2) NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO accounts(name,balance)
VALUES('Bob',10000);

-- query

-- 1
select * from accounts

-- 2
BEGIN;

INSERT INTO accounts(name,balance)
VALUES('Alice',10000);
-- => xác nhận là đã insert
-- 2.1
COMMIT;


-- 3
begin;
update accounts
set balance = balance - 1000
where id = 1;

-- 3.1
UPDATE accounts
SET balance = balance + 1000
WHERE id = 2;

-- 3.2
commit;

-- 4
ROLLBACK;

-- 5
INSERT INTO accounts(name, balance)
VALUES('Jack',0);

-- 5.1
BEGIN;

UPDATE accounts 
SET balance = balance - 1500
WHERE id = 1;

-- 5.2
UPDATE accounts
SET balance = balance + 1500
WHERE id = 3;

-- 5.3
ROLLBACK;

-- 5.4
SELECT 
    id,
    name,
    balance
FROM 
    accounts;


