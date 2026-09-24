USE ShoppingDB;

CREATE TABLE users(
user_id INT PRIMARY KEY,
username VARCHAR(50),
country VARCHAR(50),
followers int
);

CREATE TABLE posts(
post_id INT PRIMARY KEY,
user_id INT,
post_text VARCHAR(255),


FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users VALUES 
(1,'Rahul','India',800000),
(2,'Priya','India',600000),
(3,'Amit','India',300000),
(4,'Sneha','USA',900000),
(5,'John','USA',700000),
(6,'Emma','USA',400000),
(7,'Rohan','UK',200000),
(8,'Supriya','UK',100000);

INSERT INTO posts
(post_id,user_id,post_text) VALUES
(101, 1,'Learning SQL'),(102,1,'Learning Python'),(103,2,'Data Science'),(104,4,'Machine Learning'),
(105,4,'AI Tutorial'),(106,5,'Power BI'),(107,7,'First Post');


## TYPE - 1
-- Scalar Subquery :- A scalar subquery returns one row and one column , i.e. a single value 
-- A single - row subquery returns only one row/value

-- 1> Find average followers
SELECT round(AVG(followers),2) as 'Average_Followers'
FROM users;

-- 2> find the username whoose followers are less than equal to 
select username,followers
from users
where followers > (
select avg(followers)
from users
);


-- 3> Find Max Followers
select username,followers,country 
from users
where followers = (
select max(followers)
from users
);


-- 4> Find min Followers
select username,followers,country
from users
where followers = (
select min(followers)
from users
);

select username,followers,country
from users
where followers > 500000;
-- 5> Find users above 500000 followers
select username,followers,country
from users 
where followers > (
select 500000
);

-- 6> find users below 500000 country
select username,followers,country
from users
where followers < (
select 500000
);


-- TYPE 2 
-- MULTIPLE - ROW Subquery
-- A mulitple row can be return muliple row and column 

-- 1> IN with mulitple subquery 
select country ,avg(followers)
from users 
group by country
having avg(followers) > 500000;

-- Q. find users from countries whose average followers exceed 500000
select username,followers,country
from users 
where country in (
select country
from users 
group by country
having avg(followers) > 500000
);

-- 2> NOT IN 
-- 
-- Q. find users who are not from countries whose average followers exceed 500000
select username,followers,country
from users 
where country NOT IN (
select country
from users 
group by country
having avg(followers) > 500000
);

## 3> ANY with subquery
-- any compare a value with at least one value returned by the subquery

-- Q. find users whose followers are greater than at least one of these values
select username, followers
from users 
where followers > any (
select followers 
from users 
where country ='UK'
);


## 4> ALL with subquery
-- All requires the comparison to be true for every value returned by the subquery

-- Q. finds users whose followers are greater than every UK users followers.
select username,followers
from users 
where followers > all (
select followers
from users 
where country = 'UK'
);

## 5> EXISTS with subquery 
-- EXISTS checks whether the subquery returns at least one value

-- Q. find users who have created at least one post 
select username ,user_id
from users u 
where exists (
select 1
from posts p
where u.user_id=p.user_id 
);

-- 6> NOT EXISTS
-- Q. Find users who have never created a post 
select username,user_id
from users u 
where not exists (
select 1
from posts p
where u.user_id=p.user_id
);


-- TYPE 3
-- Correlated subquery : A correlated subquery references a column from the outer query and is evaluated for each outer row.

-- Q. Find users whose followers are greter than their country's average
select u1.username,
u1.country,
u1.followers
from users u1
where followers > (
SELECT 
avg(followers)
from users u2
WHERE u1.country=u2.country
);


-- Q. Find users whose followers are Less than their country's average
select u1.username,
u1.country,
u1.followers
from users u1
where followers < (
select avg(u2.followers)
from users u2
where u1.country=u2.country
);

## Subquery in form
/* A subquery inside from is called a :-
1>Derived table 2>Table Subquery 3>INline view

-- IT behaves like a temporary table and must have an alias in Mysql.

*/
--------------------------------------------
Select country,
avg(followers) as avg_followers
from users
Group by country;
--------------------------------------------

select country_data.country,
country_data.avg_followers
from (
select country,
avg(followers) as avg_followers
from users 
group by country
) as country_data
where country_data.avg_followers > 500000;

--------------------------------------------------------------------------
-- Derived Table ----
select country,
Total_users,
avg_followers
from (
select country,
avg(followers) as avg_followers,
count(user_id) as Total_users
from users 
group by country
) as country_summary where country ='USA';

select country,
Total_users,
avg_followers
from (
select country,
avg(followers) as avg_followers,
count(user_id) as Total_users
from users 
group by country
) as country_summary where country in ('USA','India');

-- 1>Derived Table Where Condition
select *
from (
select country,
avg(followers) as avg_followers,
count(user_id) as Total_users
from users 
group by country
) as country_data
WHERE avg_followers > 500000;

## Subquery in Where clause
-- Subquery in where clause are commonly used for filtering

-- Q1. Find User who have Posts
select username,user_id
from users 
where user_id in (
select user_id
from posts
);

-- Q2. Find User without posts
select username,user_id
from users 
where user_id not in (
select user_id
from posts
);

## NESTED Subquery : A Subquery can contain another Subquery
--------------------------------------------------------------------------
-- This is an inside subquery of nested subquery 
select avg(followers)
from users 
where country = (
select country
from users 
where username = 'Rahul');
-----------------------------------------------------------------------

select username,followers
from users 
where followers > (
select avg(followers)
from users 
where country = (
select country
from users 
where username = 'Rahul')
);


