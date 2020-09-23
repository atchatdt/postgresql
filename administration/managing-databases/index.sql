
-- Copy database
create database abc
with template dvdrental

-- kiểm tra hoạt động
SELECT pid, usename, client_addr 
FROM pg_stat_activity 
WHERE datname ='dvdrental';

-- Tắt hoạt động với database này
SELECT pg_terminate_backend (pid)
FROM pg_stat_activity
WHERE datname = 'dvdrental';










