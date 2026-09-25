use bankingdb;
------------------
-- VIEW 
------------------


-- CREATE OR REPLACE VIEW statement is used to modify an existing view

show tables;

CREATE TABLE customerss (
customer_id INT PRIMARY KEY,
customer_name Varchar(100),
city varchar(50),
age int,
balance decimal(12,2)
);


desc customerss;

INSERT INTO customerss(customer_id,customer_name,city,age,balance) 
VALUES 
(101,'Rahul Sharma','Nagpur',28,45000.00),
(102,'Priya Patil','Pune',32,72000.00),
(103,'Amit Verma','Mumbai',25,38000.00),
(104,'Sneha Joshi','Nagpur',30,65000.00),
(105,'Rohan Deshmukh','Pune',35,85000.00);

-- Display Records
select * from customerss;

-------------------------------------------------------------
-- CREATING VIEW 
-------------------------------------------------------------
create view citywise_highest_balance as 
select city,sum(balance) as Total_Balance
from customerss
group by city order by sum(balance) desc;

select * from citywise_highest_balance;

desc citywise_highest_balance;

-- find views in sql BASE AND VIEW TABLES 
show full tables;

---------------------------------
-- display only view 
---------------------------------
show full tables where table_type = 'VIEW';

-- Where 
select * from customerss
where balance > 50000;

create view customer_balance_gt_50000 as 
select * from customerss
where balance > 50000;
select *from customer_balance_gt_50000;
select *from customer_balance_gt_50000 where city = 'Nagpur';

delete from customer_balance_gt_50000 where city = 'Nagpur';

delete from customer_balance_gt_50000 where age =35;

select *from customer_balance_gt_50000 where age =35;

select * from customerss;

-- Order BY
select *
from customerss
order by balance desc;

-- Group by 
create view citiwise_nu_of_cust_view as
select city,count(*) as total_customers
from customerss
group by city;

select * from citiwise_nu_of_cust_view;

----------------------------
-- Modify the existing view 
----------------------------
create OR REPLACE VIEW citiwise_nu_of_cust_view as 
select city,avg(balance) as avg_balance
from customerss
group by city;

select * from citiwise_nu_of_cust_view;

-- |  HAVING   |
create view avg_balace_gt_40000_view as 
select city,avg(balance) as avg_balance
from customerss
group by city
having avg(balance) > 40000;

select * from avg_balace_gt_40000_view where city = 'Pune';

create view premium_city_view as 
select city,sum(balance) as Total_balance
from customerss
group by city
having sum(balance) > 100000 ;

select * from premium_city_view;

-- changes in existing view --
create or replace view premium_city_view as 
select city,sum(balance) as Total_balance
from customerss
group by city
having sum(balance) > 100000 and city ='Nagpur';

select * from premium_city_view;

--------------------------------------
-- CASE -When- Then - Else - END 
--------------------------------------

-- Create view with calculated balance
create view high_balance_customers as
select 
customer_id,
customer_name,
city,
balance
from customerss
where balance > 50000;

-- Display View
select * from high_balance_customers;
------------------------------------------

------------------------------------------
select 
customer_id,
customer_name,
city,
balance,
CASE 
when balance >=50000 then 'High Balance'
else 'Low Balance'
end as balance_status
from customerss;


--------------------------------
-- CASE -- END  With view 
--------------------------------
create view customer_balance_status as 
select 
customer_id,
customer_name,
city,
balance,
CASE 
when balance >=50000 then 'High Balance'
else 'Low Balance'
end as balance_status
from customerss;

select * from customer_balance_status;


--------------------------------------------------
-- Banking Analyze with aggregation functions --
--------------------------------------------------
create view banking_analysis_view as 
select city,
count(*) as 'Number Of Customers',
min(balance) as 'Minimum Balance',
max(balance) as 'Maximum Balance',
round(avg(balance),2) as 'Average Balance',
sum(balance) as 'Total Balance'
from customerss 
group by city;

select * from banking_analysis_view;













